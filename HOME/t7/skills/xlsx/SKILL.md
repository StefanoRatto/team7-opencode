---
name: xlsx
description: "Use this skill whenever the user wants to create, read, edit, or manipulate Excel spreadsheets (.xlsx files). Triggers include: any mention of 'Excel', 'spreadsheet', '.xlsx', '.xls', or requests to produce data tables, reports with formulas, charts, pivot-style summaries, or structured data exports. Also use when extracting data from spreadsheets, converting CSV/JSON to xlsx, merging multiple sheets, applying conditional formatting, creating dashboards, or generating data-driven reports. If the user asks for tabular data output as a spreadsheet or Excel file, use this skill. Do NOT use for PDFs, Word documents, Google Sheets, or general coding tasks unrelated to spreadsheet generation."
license: Proprietary. LICENSE.txt has complete terms
---

# XLSX creation, editing, and analysis

## Overview

A .xlsx file is a ZIP archive containing XML files (Open XML SpreadsheetML format). This skill covers reading, creating, and editing Excel spreadsheets using Python libraries.

## Quick Reference

| Task | Approach |
|------|----------|
| Read/analyze content | `openpyxl` (preserves formatting) or unpack for raw XML |
| Create new spreadsheet | `openpyxl` for feature-rich or `xlsxwriter` for performance |
| Edit existing spreadsheet | `openpyxl` load + modify + save |
| Raw XML access | Unpack → edit XML → repack (same as docx/pptx) |
| CSV/JSON to xlsx | `openpyxl` with data import |

### Converting .xls to .xlsx

Legacy `.xls` files must be converted before editing:

```bash
python scripts/office/soffice.py --headless --convert-to xlsx spreadsheet.xls
```

### Reading Content

```python
from openpyxl import load_workbook

wb = load_workbook("spreadsheet.xlsx", data_only=True)  # data_only=True reads cached formula values
for sheet_name in wb.sheetnames:
    ws = wb[sheet_name]
    print(f"--- {sheet_name} ({ws.max_row} rows x {ws.max_column} cols) ---")
    for row in ws.iter_rows(values_only=True):
        print(row)
```

```bash
# Raw XML access (same shared scripts as docx/pptx)
python scripts/office/unpack.py spreadsheet.xlsx unpacked/
```

### Converting to PDF (for visual QA)

```bash
python scripts/office/soffice.py --headless --convert-to pdf spreadsheet.xlsx
```

---

## Creating New Spreadsheets with openpyxl

`openpyxl` is the primary library for feature-rich spreadsheets (formatting, formulas, charts, images, data validation). Use it for most tasks.

### Basic Setup

```python
from openpyxl import Workbook
from openpyxl.styles import Font, PatternFill, Alignment, Border, Side, numbers
from openpyxl.utils import get_column_letter
from openpyxl.chart import BarChart, PieChart, LineChart, Reference
from openpyxl.formatting.rule import CellIsRule, ColorScaleRule, DataBarRule
from openpyxl.worksheet.datavalidation import DataValidation

wb = Workbook()
ws = wb.active
ws.title = "Sheet1"

# Write data
ws["A1"] = "Header"
ws.append(["Col1", "Col2", "Col3"])  # append row
ws.cell(row=2, column=1, value="Cell value")

wb.save("output.xlsx")
```

### Styles and Formatting

```python
# Font
header_font = Font(name="Arial", size=12, bold=True, color="FFFFFF")

# Fill (background color)
header_fill = PatternFill(start_color="2E75B6", end_color="2E75B6", fill_type="solid")

# Alignment
center = Alignment(horizontal="center", vertical="center", wrap_text=True)

# Border
thin_border = Border(
    left=Side(style="thin"),
    right=Side(style="thin"),
    top=Side(style="thin"),
    bottom=Side(style="thin"),
)

# Apply to cells
for cell in ws[1]:  # first row
    cell.font = header_font
    cell.fill = header_fill
    cell.alignment = center
    cell.border = thin_border
```

### Column Widths and Row Heights

```python
# Auto-fit approximation (openpyxl does not auto-fit natively)
for col_idx, column_cells in enumerate(ws.columns, 1):
    max_length = 0
    for cell in column_cells:
        if cell.value:
            max_length = max(max_length, len(str(cell.value)))
    adjusted_width = min(max_length + 2, 50)  # cap at 50
    ws.column_dimensions[get_column_letter(col_idx)].width = adjusted_width

# Explicit widths
ws.column_dimensions["A"].width = 25
ws.column_dimensions["B"].width = 15

# Row height
ws.row_dimensions[1].height = 30  # header row
```

### Number Formats

```python
# Currency
ws["B2"].number_format = '"$"#,##0.00'

# Percentage
ws["C2"].number_format = '0.00%'

# Date
ws["D2"].number_format = 'YYYY-MM-DD'

# Thousands separator
ws["E2"].number_format = '#,##0'

# Custom
ws["F2"].number_format = '0.0##'
```

### Formulas

```python
# Standard formulas
ws["B10"] = "=SUM(B2:B9)"
ws["C10"] = "=AVERAGE(C2:C9)"
ws["D10"] = '=IF(B10>1000,"Over budget","OK")'
ws["E10"] = "=VLOOKUP(A2,Sheet2!A:B,2,FALSE)"
ws["F10"] = "=COUNTIF(B2:B9,\">100\")"

# CRITICAL: Formulas are stored as text. Excel recalculates on open.
# To read computed values from existing files, use load_workbook(data_only=True)
```

### Conditional Formatting

```python
# Color scale (green-yellow-red)
ws.conditional_formatting.add(
    "B2:B100",
    ColorScaleRule(start_type="min", start_color="63BE7B",
                   mid_type="percentile", mid_value=50, mid_color="FFEB84",
                   end_type="max", end_color="F8696B")
)

# Cell value rules
red_fill = PatternFill(start_color="FFC7CE", end_color="FFC7CE", fill_type="solid")
red_font = Font(color="9C0006")
ws.conditional_formatting.add(
    "C2:C100",
    CellIsRule(operator="lessThan", formula=["0"], fill=red_fill, font=red_font)
)

# Data bars
ws.conditional_formatting.add(
    "D2:D100",
    DataBarRule(start_type="min", end_type="max", color="638EC6")
)
```

### Charts

```python
# Bar chart
chart = BarChart()
chart.title = "Sales by Quarter"
chart.x_axis.title = "Quarter"
chart.y_axis.title = "Revenue ($)"
chart.style = 10  # built-in style

data = Reference(ws, min_col=2, min_row=1, max_col=2, max_row=5)  # data including header
cats = Reference(ws, min_col=1, min_row=2, max_row=5)              # category labels
chart.add_data(data, titles_from_data=True)
chart.set_categories(cats)
chart.shape = 4  # rectangle

ws.add_chart(chart, "E2")  # anchor cell

# Pie chart
pie = PieChart()
pie.title = "Market Share"
pie.add_data(Reference(ws, min_col=2, min_row=1, max_row=5), titles_from_data=True)
pie.set_categories(Reference(ws, min_col=1, min_row=2, max_row=5))
ws.add_chart(pie, "E18")

# Line chart
line = LineChart()
line.title = "Trend"
line.add_data(Reference(ws, min_col=2, min_row=1, max_row=13), titles_from_data=True)
line.set_categories(Reference(ws, min_col=1, min_row=2, max_row=13))
ws.add_chart(line, "E34")
```

### Data Validation (Dropdowns)

```python
# Dropdown list
dv = DataValidation(type="list", formula1='"Yes,No,Maybe"', allow_blank=True)
dv.error = "Please select Yes, No, or Maybe"
dv.errorTitle = "Invalid input"
ws.add_data_validation(dv)
dv.add("C2:C100")

# Number range
dv_num = DataValidation(type="whole", operator="between", formula1=1, formula2=100)
dv_num.error = "Enter a number between 1 and 100"
ws.add_data_validation(dv_num)
dv_num.add("D2:D100")
```

### Freeze Panes and Auto-Filter

```python
# Freeze header row
ws.freeze_panes = "A2"  # freeze above row 2

# Freeze first column and header
ws.freeze_panes = "B2"  # freeze left of col B and above row 2

# Auto-filter (dropdown arrows on header row)
ws.auto_filter.ref = f"A1:{get_column_letter(ws.max_column)}{ws.max_row}"
```

### Multiple Sheets

```python
wb = Workbook()
ws1 = wb.active
ws1.title = "Summary"

ws2 = wb.create_sheet("Data")
ws3 = wb.create_sheet("Charts")

# Cross-sheet references in formulas
ws1["A1"] = "=Data!B10"
```

### Merge Cells

```python
ws.merge_cells("A1:D1")
ws["A1"] = "Merged Title"
ws["A1"].alignment = Alignment(horizontal="center")

# Unmerge
ws.unmerge_cells("A1:D1")
```

### Images

```python
from openpyxl.drawing.image import Image

img = Image("logo.png")
img.width = 200
img.height = 100
ws.add_image(img, "A1")
```

### Page Setup (Print)

```python
ws.page_setup.orientation = ws.ORIENTATION_LANDSCAPE
ws.page_setup.paperSize = ws.PAPERSIZE_LETTER
ws.page_setup.fitToWidth = 1
ws.page_setup.fitToHeight = 0  # 0 = as many pages as needed

# Print headers
ws.print_title_rows = "1:1"  # repeat row 1 on every printed page

# Print area
ws.print_area = f"A1:{get_column_letter(ws.max_column)}{ws.max_row}"
```

---

## Creating with xlsxwriter (High Performance)

Use `xlsxwriter` when creating large spreadsheets (100k+ rows) or when you need advanced chart customization. Write-only -- cannot read existing files.

### Basic Setup

```python
import xlsxwriter

wb = xlsxwriter.Workbook("output.xlsx")
ws = wb.add_worksheet("Sheet1")

# Formats
header_fmt = wb.add_format({
    "bold": True, "font_size": 12, "font_color": "white",
    "bg_color": "#2E75B6", "border": 1,
    "align": "center", "valign": "vcenter",
})
currency_fmt = wb.add_format({"num_format": "$#,##0.00"})
pct_fmt = wb.add_format({"num_format": "0.00%"})

# Write data
ws.write("A1", "Header", header_fmt)
ws.write_row(1, 0, ["Data1", 100, 0.15])  # row 1, col 0
ws.write_column("A2", ["Row1", "Row2", "Row3"])

# Column widths
ws.set_column("A:A", 25)  # col A = 25 chars wide
ws.set_column("B:D", 15)

# Formulas
ws.write_formula("B10", "=SUM(B2:B9)", currency_fmt)

# Freeze panes
ws.freeze_panes(1, 0)  # freeze row 1

# Auto-filter
ws.autofilter("A1:D100")

# Conditional formatting
ws.conditional_format("B2:B100", {
    "type": "3_color_scale",
    "min_color": "#63BE7B",
    "mid_color": "#FFEB84",
    "max_color": "#F8696B",
})

wb.close()  # CRITICAL: must close to write file
```

---

## Editing Existing Spreadsheets

### With openpyxl (Recommended)

```python
from openpyxl import load_workbook

wb = load_workbook("existing.xlsx")
ws = wb.active

# Modify cells
ws["A1"] = "Updated value"

# Add new rows
ws.append(["New", "Row", "Data"])

# Delete rows/columns
ws.delete_rows(5, 3)     # delete 3 rows starting at row 5
ws.delete_cols(2, 1)     # delete 1 column starting at col 2

# Insert rows/columns
ws.insert_rows(1)        # insert blank row at top
ws.insert_cols(1)        # insert blank column at left

wb.save("modified.xlsx")
```

**CRITICAL: openpyxl drops some Excel features on load/save.** These are lost:
- VBA macros (use `keep_vba=True` for .xlsm files)
- Sparklines
- Some advanced chart customizations
- External data connections

For lossless editing of complex files, use the unpack/edit XML/repack approach.

### Raw XML Editing (Lossless)

Same workflow as docx/pptx. Use when preserving all Excel features is required.

```bash
# Unpack
python scripts/office/unpack.py spreadsheet.xlsx unpacked/

# Edit XML files in unpacked/xl/
# - unpacked/xl/worksheets/sheet1.xml  (cell data)
# - unpacked/xl/sharedStrings.xml       (string table)
# - unpacked/xl/styles.xml              (formatting)
# - unpacked/xl/workbook.xml            (sheet names, structure)

# Repack
python scripts/office/pack.py unpacked/ output.xlsx --original spreadsheet.xlsx
```

### Validate

```bash
python scripts/office/validate.py output.xlsx
```

---

## Common Patterns

### CSV to XLSX

```python
import csv
from openpyxl import Workbook
from openpyxl.styles import Font, PatternFill, Border, Side, Alignment

wb = Workbook()
ws = wb.active

with open("data.csv") as f:
    reader = csv.reader(f)
    for row in reader:
        ws.append(row)

# Style header row
header_fill = PatternFill(start_color="2E75B6", end_color="2E75B6", fill_type="solid")
header_font = Font(bold=True, color="FFFFFF")
for cell in ws[1]:
    cell.fill = header_fill
    cell.font = header_font

# Auto-width columns
for col in ws.columns:
    max_len = max(len(str(c.value or "")) for c in col)
    ws.column_dimensions[get_column_letter(col[0].column)].width = min(max_len + 2, 50)

ws.freeze_panes = "A2"
ws.auto_filter.ref = ws.dimensions
wb.save("output.xlsx")
```

### JSON to XLSX

```python
import json
from openpyxl import Workbook

with open("data.json") as f:
    data = json.load(f)

wb = Workbook()
ws = wb.active

# Write headers from first record keys
if data:
    headers = list(data[0].keys())
    ws.append(headers)
    for record in data:
        ws.append([record.get(h) for h in headers])

wb.save("output.xlsx")
```

### Multi-Sheet Report with Summary

```python
from openpyxl import Workbook

wb = Workbook()

# Data sheets
for dept in ["Sales", "Engineering", "Marketing"]:
    ws = wb.create_sheet(dept)
    ws.append(["Name", "Amount", "Date"])
    # ... populate data ...

# Summary sheet (first position)
summary = wb.create_sheet("Summary", 0)
summary.append(["Department", "Total", "Count"])
summary.append(["Sales", "=SUM(Sales!B2:B1000)", "=COUNTA(Sales!A2:A1000)"])
summary.append(["Engineering", "=SUM(Engineering!B2:B1000)", "=COUNTA(Engineering!A2:A1000)"])
summary.append(["Marketing", "=SUM(Marketing!B2:B1000)", "=COUNTA(Marketing!A2:A1000)"])

# Remove default empty sheet
if "Sheet" in wb.sheetnames:
    del wb["Sheet"]

wb.save("report.xlsx")
```

---

## Critical Rules

- **Always close xlsxwriter workbooks** -- `wb.close()` writes the file; without it nothing is saved
- **openpyxl `data_only=True`** -- reads cached formula values (last computed by Excel); without it you get formula strings
- **openpyxl drops some features** -- VBA macros, sparklines, some chart types are lost on load/save; use raw XML for lossless editing
- **Formulas are NOT recalculated** -- openpyxl and xlsxwriter store formulas as text; values are computed when Excel opens the file
- **Column references are 1-indexed** -- `ws.cell(row=1, column=1)` is cell A1; there is no row 0 or column 0
- **get_column_letter()** -- converts column number to letter (1->"A", 27->"AA"); always import from `openpyxl.utils`
- **Shared strings** -- Excel stores strings in a shared table (`xl/sharedStrings.xml`); when editing raw XML, update the shared string index, not cell XML directly
- **Date handling** -- openpyxl stores dates as Python datetime objects; apply number_format for display (`'YYYY-MM-DD'` or `'MM/DD/YYYY'`)
- **Large files** -- use `xlsxwriter` for 100k+ rows (streaming write); or `openpyxl` with `write_only=True` mode
- **Auto-filter requires ref** -- set `ws.auto_filter.ref` to the data range including headers
- **Freeze panes** -- `ws.freeze_panes = "A2"` freezes row 1; the string is the top-left cell of the unfrozen area

---

## Dependencies

- **openpyxl**: `pip install openpyxl` (read, write, edit .xlsx -- primary library)
- **xlsxwriter**: `pip install xlsxwriter` (write-only, high performance for large files)
- **LibreOffice**: PDF/format conversion (auto-configured via `scripts/office/soffice.py`)
