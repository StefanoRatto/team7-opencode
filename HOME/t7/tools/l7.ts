import { tool } from "@opencode-ai/plugin"
import path from "path"

const L7_SCRIPT = path.join(
  process.env.HOME || "~",
  ".config/opencode/commands/l7/l7",
)

export default tool({
  description:
    "Execute l7 (Loop 7) -- the autonomous AI task loop. " +
    "Runs a WPRD task list or a single task string through the l7 engine. " +
    "l7 picks up each pending task, delegates to the AI, verifies the result, and marks it done. " +
    "Use this tool to launch l7 runs from within opencode.",
  args: {
    target: tool.schema
      .string()
      .describe(
        "WPRD file path (e.g. WPRD.md, projects/api/WPRD.md) or a quoted task description string for single-task mode",
      ),
    model: tool.schema
      .string()
      .optional()
      .describe("Override the AI model (e.g. gpt-4o, o3-mini, claude-sonnet)"),
    maxIterations: tool.schema
      .number()
      .optional()
      .describe("Stop after N tasks (0 = unlimited, default: unlimited)"),
    maxRetries: tool.schema
      .number()
      .optional()
      .describe("Max retries per failed task (default: 3)"),
    retryDelay: tool.schema
      .number()
      .optional()
      .describe("Seconds between retries (default: 5)"),
    aiTimeout: tool.schema
      .number()
      .optional()
      .describe("Max seconds per AI worker call (default: 900)"),
    reviewTimeout: tool.schema
      .number()
      .optional()
      .describe("Max seconds per AI review call (default: 300)"),
    noVerify: tool.schema
      .boolean()
      .optional()
      .describe("Skip verify: shell checks from the WPRD"),
    noReview: tool.schema
      .boolean()
      .optional()
      .describe("Skip the AI review pass (and accept: checking)"),
    dryRun: tool.schema
      .boolean()
      .optional()
      .describe(
        "Show the prompt that would be sent without executing. Useful for previewing.",
      ),
    verbose: tool.schema
      .boolean()
      .optional()
      .describe("Enable debug output"),
  },
  async execute(args, context) {
    // Build the l7 command from structured arguments
    const parts: string[] = [L7_SCRIPT]

    if (args.model) {
      parts.push("--model", args.model)
    }
    if (args.maxIterations !== undefined) {
      parts.push("--max-iterations", String(args.maxIterations))
    }
    if (args.maxRetries !== undefined) {
      parts.push("--max-retries", String(args.maxRetries))
    }
    if (args.retryDelay !== undefined) {
      parts.push("--retry-delay", String(args.retryDelay))
    }
    if (args.aiTimeout !== undefined) {
      parts.push("--ai-timeout", String(args.aiTimeout))
    }
    if (args.reviewTimeout !== undefined) {
      parts.push("--review-timeout", String(args.reviewTimeout))
    }
    if (args.noVerify) {
      parts.push("--no-verify")
    }
    if (args.noReview) {
      parts.push("--no-review")
    }
    if (args.dryRun) {
      parts.push("--dry-run")
    }
    if (args.verbose) {
      parts.push("-v")
    }

    // The target (WPRD path or task string) goes last
    parts.push(args.target)

    const cmd = parts.map((p) => (p.includes(" ") ? `"${p}"` : p)).join(" ")

    try {
      const proc = Bun.spawn(["bash", "-c", cmd], {
        cwd: context.directory,
        env: {
          ...process.env,
          // Force non-interactive, no color (clean output for the agent)
          TERM: "dumb",
        },
        stdout: "pipe",
        stderr: "pipe",
      })

      const stdout = await new Response(proc.stdout).text()
      const stderr = await new Response(proc.stderr).text()
      const exitCode = await proc.exited

      let result = ""
      if (stdout.trim()) {
        result += stdout.trim()
      }
      if (stderr.trim()) {
        result += "\n\n[stderr]\n" + stderr.trim()
      }
      result += `\n\n[exit code: ${exitCode}]`
      result += `\n[command: ${cmd}]`

      return result || `l7 completed with exit code ${exitCode}`
    } catch (err: any) {
      return `l7 execution failed: ${err.message}\n[command: ${cmd}]`
    }
  },
})
