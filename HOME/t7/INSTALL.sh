#!/usr/bin/env bash
#
# ████████ ███████   ███   ███    ███ ███████
#    ██             ██ ██  ████  ████      ██
#    ██    █████   ██   ██ ██ ████ ██    ██
#    ██            ██   ██ ██  ██  ██   ██
#    ██    ███████ ███████ ██      ██  ██
#
# team7 installer
#
# =============================================================================
# Sourced-mode wrapper
# -----------------------------------------------------------------------------
# This block must be valid syntax in BOTH bash and zsh because sourcing from
# zsh runs this file under zsh (the shebang is ignored when sourced). Any
# zsh-only syntax is hidden from bash's parser via 'eval' on a single-quoted
# string; any bash-only array indexing returns empty in zsh without error.
# =============================================================================
_t7_sourced=0
_t7_self=""
if [[ -n "${ZSH_VERSION:-}" ]]; then
    case "${ZSH_EVAL_CONTEXT:-}" in *:file*) _t7_sourced=1 ;; esac
    # zsh-specific path-of-current-script; hidden from bash's parser.
    eval '_t7_self=${(%):-%x}'
elif [[ -n "${BASH_VERSION:-}" ]]; then
    _t7_self="${BASH_SOURCE[0]}"
    [[ "${BASH_SOURCE[0]}" != "${0}" ]] && _t7_sourced=1
fi

if [[ "${_t7_sourced}" -eq 1 ]]; then
    if [[ -z "${_t7_self}" || ! -f "${_t7_self}" ]]; then
        printf '\033[97m[FAIL] could not resolve script path for sourced install\033[0m\n' >&2
        unset _t7_sourced _t7_self
        return 1
    fi
    _t7_self="$(cd "$(dirname "${_t7_self}")" && pwd)/$(basename "${_t7_self}")"

    # Delegate the real work to a fresh bash process so set -e / ERR trap /
    # exit / cd cannot leak into the caller's interactive shell.
    if bash "${_t7_self}"; then
        # Symlinks are already on PATH via ~/.local/bin; nothing to activate
        # in the current shell. Just confirm they are reachable.
        if command -v t7 >/dev/null 2>&1; then
            if [[ -t 1 ]]; then
                printf '\033[90m    t7 is available on PATH (type: t7)\033[0m\n'
            else
                printf '    t7 is available on PATH (type: t7)\n'
            fi
        else
            if [[ -t 1 ]]; then
                printf '\033[90m    symlinks created; add ~/.local/bin to PATH if not already present\033[0m\n'
            else
                printf '    symlinks created; add ~/.local/bin to PATH if not already present\n'
            fi
        fi
        unset _t7_sourced _t7_self
        return 0
    else
        _t7_rc=$?
        unset _t7_sourced _t7_self
        return "${_t7_rc}"
    fi
fi
unset _t7_sourced _t7_self

# =============================================================================
# From here on we are executed (not sourced): safe to use set -e, traps, etc.
# =============================================================================
set -euo pipefail

# -----------------------------------------------------------------------------
# Colors (24-bit ANSI, suppressed automatically when stdout is not a TTY)
# -----------------------------------------------------------------------------
# Gold (#a57c00) for brand output, white for normal text, dim gray for
# secondary / progress detail. Standard cyan used for the final success banner.
if [[ -t 1 ]]; then
    C_BRAND=$'\033[38;2;165;124;0m'
    C_CYAN=$'\033[36m'
    C_WHITE=$'\033[97m'
    C_DIM=$'\033[90m'
    C_RESET=$'\033[0m'
else
    C_BRAND='' C_CYAN='' C_WHITE='' C_DIM='' C_RESET=''
fi
readonly C_BRAND C_CYAN C_WHITE C_DIM C_RESET

# -----------------------------------------------------------------------------
# Detect OS and architecture for platform-specific binary path
# -----------------------------------------------------------------------------
_detect_os() {
    local kernel
    kernel="$(uname -s)"
    case "${kernel}" in
        Linux)  echo "linux"   ;;
        Darwin) echo "darwin"  ;;
        CYGWIN*|MINGW*|MSYS*) echo "windows" ;;
        *)      die "unsupported operating system: ${kernel}" ;;
    esac
}

_detect_arch() {
    local machine
    machine="$(uname -m)"
    case "${machine}" in
        x86_64|amd64)          echo "x64"   ;;
        aarch64|arm64)         echo "arm64" ;;
        *)                     die "unsupported architecture: ${machine}" ;;
    esac
}

readonly T7_OS="$(_detect_os)"
readonly T7_ARCH="$(_detect_arch)"

# -----------------------------------------------------------------------------
# Paths -- T7_HOME is always ~/.t7 regardless of where the script is launched
# -----------------------------------------------------------------------------
readonly T7_HOME="${HOME}/.t7"
readonly LOGO_FILE="${T7_HOME}/t7.txt"
readonly PATCH_FILE="${T7_HOME}/t7.patch"
readonly OPENCODE_DIR="${T7_HOME}/opencode"
readonly OPENCODE_REPO="https://github.com/anomalyco/opencode.git"
readonly OPENCODE_REF="v1.14.25"
readonly OPENCODE_BINARY="${OPENCODE_DIR}/packages/opencode/dist/opencode-${T7_OS}-${T7_ARCH}/bin/opencode"
readonly LOCAL_BIN="${HOME}/.local/bin"
readonly T7_SCRIPT="${T7_HOME}/t7"
readonly L7_SCRIPT="${T7_HOME}/commands/l7/l7"
readonly T7_SYMLINK="${LOCAL_BIN}/t7"
readonly L7_SYMLINK="${LOCAL_BIN}/l7"
readonly THEMES_SRC="${T7_HOME}/themes"
readonly THEMES_DST="${HOME}/.config/opencode/themes"

# -----------------------------------------------------------------------------
# Output helpers
# -----------------------------------------------------------------------------
brand() { printf '%s%s%s\n' "${C_BRAND}" "$*" "${C_RESET}"; }
cyan()  { printf '%s%s%s\n' "${C_CYAN}"  "$*" "${C_RESET}"; }
info()  { printf '%s%s%s\n' "${C_WHITE}" "$*" "${C_RESET}"; }
dim()   { printf '%s%s%s\n' "${C_DIM}"   "$*" "${C_RESET}"; }

die() {
    printf '%s[FAIL] %s%s\n' "${C_WHITE}" "$*" "${C_RESET}" >&2
    exit 1
}

on_err() {
    local exit_code=$? line=${1:-?}
    printf '%s[FAIL] aborted at line %s (exit %s)%s\n' \
        "${C_WHITE}" "${line}" "${exit_code}" "${C_RESET}" >&2
}
trap 'on_err ${LINENO}' ERR

print_logo() {
    local color="${1:-${C_BRAND}}"
    [[ -f "${LOGO_FILE}" ]] || { dim "[!!] logo file missing: ${LOGO_FILE}"; return 0; }
    printf '%s' "${color}"
    cat "${LOGO_FILE}"
    printf '%s\n' "${C_RESET}"
}

require_cmd() {
    local cmd="$1"
    command -v "${cmd}" >/dev/null 2>&1 \
        || die "required command not found: ${cmd}"
}

# Helper: force-create a symlink. Removes whatever is at link_path first
# (stale symlink, regular file, directory) so the install never fails.
# Usage: ensure_symlink <target> <link_path> <display_name>
ensure_symlink() {
    local target="$1" link_path="$2" name="$3"

    if [[ -L "${link_path}" ]]; then
        local existing_target
        existing_target="$(readlink "${link_path}")"
        if [[ "${existing_target}" == "${target}" ]]; then
            dim  "    ${name}: ok"
            return
        fi
        dim  "    ${name}: replacing (was: ${existing_target})"
    elif [[ -e "${link_path}" ]]; then
        dim  "    ${name}: replacing (was: regular file)"
    fi

    ln -sf "${target}" "${link_path}" \
        || die "failed to create symlink: ${link_path}"
    dim  "    ${name}: ${link_path} -> ${target}"
}

# -----------------------------------------------------------------------------
# Step 1: logo in brand color
# -----------------------------------------------------------------------------
echo
print_logo "${C_BRAND}"

# -----------------------------------------------------------------------------
# Step 2: pre-flight checks (fail fast before network / build work)
# -----------------------------------------------------------------------------
info "[>>] Starting team7 installation"
dim  "    home: ${T7_HOME}"

[[ -d "${T7_HOME}" ]] || die "team7 home directory not found: ${T7_HOME}"

require_cmd curl
require_cmd git
require_cmd bash

[[ -f "${LOGO_FILE}"  ]] || die "missing logo file:  ${LOGO_FILE}"
[[ -f "${PATCH_FILE}" ]] || die "missing patch file: ${PATCH_FILE}"
[[ -f "${T7_SCRIPT}"  ]] || die "missing t7 launcher: ${T7_SCRIPT}"
[[ -f "${L7_SCRIPT}"  ]] || die "missing l7 script:   ${L7_SCRIPT}"

# -----------------------------------------------------------------------------
# Step 3: install / upgrade bun (official installer is idempotent and upgrades)
# -----------------------------------------------------------------------------
info "[>>] Ensuring bun is installed and up to date"
if command -v bun >/dev/null 2>&1; then
    dim  "    found bun at:    $(command -v bun)"
    dim  "    current version: $(bun --version 2>/dev/null || echo unknown)"
else
    dim  "    bun not found, installing"
fi

curl -fsSL https://bun.com/install | bash \
    || die "failed to install bun"

# Make a freshly-installed bun visible on PATH for the rest of this script.
if ! command -v bun >/dev/null 2>&1; then
    if [[ -x "${HOME}/.bun/bin/bun" ]]; then
        export PATH="${HOME}/.bun/bin:${PATH}"
    fi
fi
command -v bun >/dev/null 2>&1 || die "bun not available on PATH after install"
dim  "    using bun:       $(bun --version) at $(command -v bun)"

# -----------------------------------------------------------------------------
# Step 4: clone opencode at the pinned tag (re-use validated existing checkout)
# -----------------------------------------------------------------------------
info "[>>] Cloning opencode ${OPENCODE_REF}"
if [[ -d "${OPENCODE_DIR}" ]]; then
    if [[ ! -d "${OPENCODE_DIR}/.git" ]]; then
        dim  "    ${OPENCODE_DIR} exists but is not a git repo, removing"
        rm -rf "${OPENCODE_DIR}"
    else
        existing_ref="$(git -C "${OPENCODE_DIR}" describe --tags --exact-match 2>/dev/null \
                        || git -C "${OPENCODE_DIR}" rev-parse --abbrev-ref HEAD 2>/dev/null \
                        || echo unknown)"
        if [[ "${existing_ref}" == "${OPENCODE_REF}" ]]; then
            dim  "    ${OPENCODE_DIR} already at ${OPENCODE_REF}, reusing"
        else
            dim  "    found ${existing_ref}, need ${OPENCODE_REF} -- removing stale checkout"
            rm -rf "${OPENCODE_DIR}"
        fi
    fi
fi

if [[ ! -d "${OPENCODE_DIR}" ]]; then
    git clone --branch "${OPENCODE_REF}" --depth 1 "${OPENCODE_REPO}" "${OPENCODE_DIR}" \
        || die "failed to clone ${OPENCODE_REPO}"
fi

# -----------------------------------------------------------------------------
# Step 5: move into opencode
# -----------------------------------------------------------------------------
info "[>>] Entering opencode directory"
cd "${OPENCODE_DIR}"
dim  "    cwd: $(pwd)"

# -----------------------------------------------------------------------------
# Step 6: install opencode dependencies
# -----------------------------------------------------------------------------
info "[>>] Installing opencode dependencies"
bun install || die "bun install failed"

# -----------------------------------------------------------------------------
# Step 7: apply team7 patch (idempotent)
# -----------------------------------------------------------------------------
info "[>>] Applying team7 patch"
if git apply --reverse --check "${PATCH_FILE}" >/dev/null 2>&1; then
    dim  "    patch already applied, skipping"
elif git apply --check "${PATCH_FILE}" >/dev/null 2>&1; then
    git apply "${PATCH_FILE}" || die "git apply failed for ${PATCH_FILE}"
    dim  "    patch applied"
else
    die "patch does not apply cleanly against ${OPENCODE_DIR} (neither forward nor reverse); remove ${OPENCODE_DIR} and re-run"
fi

# -----------------------------------------------------------------------------
# Step 8: build the opencode binary
# -----------------------------------------------------------------------------
info "[>>] Building opencode binary"
OPENCODE_VERSION=" team7" ./packages/opencode/script/build.ts --single \
    || die "build.ts failed"

# Verify the binary ended up where the t7 wrapper expects it.
if [[ ! -x "${OPENCODE_BINARY}" ]]; then
    die "build completed but expected binary not found: ${OPENCODE_BINARY}"
fi
dim  "    binary: ${OPENCODE_BINARY}"

# -----------------------------------------------------------------------------
# Step 9: install team7 plugin dependencies (for tools/l7.ts)
# -----------------------------------------------------------------------------
info "[>>] Installing team7 plugin dependencies"
cd "${T7_HOME}"

# Generate package.json if absent (gitignored -- won't exist on fresh deploys)
if [[ ! -f "${T7_HOME}/package.json" ]]; then
    cat > "${T7_HOME}/package.json" << 'PKGJSON'
{
  "dependencies": {
    "@opencode-ai/plugin": "^1.3.3"
  }
}
PKGJSON
    dim  "    created package.json"
fi

bun install || die "bun install failed in ${T7_HOME}"
dim  "    installed @opencode-ai/plugin"

# -----------------------------------------------------------------------------
# Step 10: create symlinks in ~/.local/bin (idempotent)
# -----------------------------------------------------------------------------
info "[>>] Creating symlinks in ${LOCAL_BIN}"
if [[ ! -d "${LOCAL_BIN}" ]]; then
    mkdir -p "${LOCAL_BIN}"
    dim  "    created ${LOCAL_BIN}"
fi

# Ensure t7 and l7 are executable
chmod +x "${T7_SCRIPT}" "${L7_SCRIPT}"

ensure_symlink "${T7_SCRIPT}" "${T7_SYMLINK}" "t7"
ensure_symlink "${L7_SCRIPT}" "${L7_SYMLINK}" "l7"

# -----------------------------------------------------------------------------
# Step 11: symlink theme files to ~/.config/opencode/themes/ (idempotent)
# -----------------------------------------------------------------------------
info "[>>] Symlinking themes to ${THEMES_DST}"
mkdir -p "${THEMES_DST}"

for theme_file in "${THEMES_SRC}"/team7-*.json; do
    [[ -f "${theme_file}" ]] || continue
    local_name="$(basename "${theme_file}")"
    ensure_symlink "${theme_file}" "${THEMES_DST}/${local_name}" "${local_name}"
done

# -----------------------------------------------------------------------------
# Step 12: final logo + confirmation
# -----------------------------------------------------------------------------

echo
cyan "[OK] team7 installation complete"
dim  "    t7:     ${T7_SYMLINK}"
dim  "    l7:     ${L7_SYMLINK}"
