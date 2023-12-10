# Create an Excel instance
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $true
$workbook = $excel.Workbooks.Add()
$worksheet = $workbook.Worksheets.Item(1)

# Define your data
$priace_input = @(0.2219, 0.444, 4.437, 8.873) # /1,000 token
$priace_output = @(0.2958, 0.592, 8.873, 17.746) # /1,000 token
$input_num = 27/1000*10*20*200
$output_num = 569/1000*10*20*200
$values = for ($i = 0; $i -lt $priace_input.Length; $i++) {
    $input_num * $priace_input[$i] + $output_num * $priace_output[$i]
}

# Populate Excel with data
$items = @('GPT-3.5-Turbo (4K)', 'GPT-3.5-Turbo (16K)', 'GPT-4 (8K)', 'GPT-4 (32K)')
for ($i = 0; $i -lt $items.Length; $i++) {
    $worksheet.Cells.Item($i + 2, 1) = $items[$i]
    $worksheet.Cells.Item($i + 2, 2) = $values[$i]
}

# Define chart range and create chart
$range = $worksheet.Range("A1:B5")
$chart = $worksheet.Shapes.AddChart().Chart
$chart.SetSourceData($range)
$chart.ChartType = -57 # xlColumnClustered

# Set chart size
$chartWidth = 800 # width in pixels
$chartHeight = 500 # height in pixels

$chart.Parent.Width = $chartWidth
$chart.Parent.Height = $chartHeight

# Customize chart (titles, labels, etc.)
$chart.HasTitle = $true
$chart.ChartTitle.Text = "モデル別1ヵ月の費用"
$chart.ChartTitle.Font.Name = "MS Gothic"
$chart.ChartTitle.Font.Size = 25

$chart.Axes(1).HasTitle = $true # 1 = xlCategory
$chart.Axes(1).AxisTitle.Text = "AI Model"
$chart.Axes(1).AxisTitle.Font.Name = "Times New Roman"
$chart.Axes(1).AxisTitle.Font.Size = 25

$chart.Axes(2).HasTitle = $true # 2 = xlValue
$chart.Axes(2).AxisTitle.Text = "JPY"
$chart.Axes(2).AxisTitle.Font.Name = "Times New Roman"
$chart.Axes(2).AxisTitle.Font.Size = 25


# Customize axis font sizes
$xAxisFontSize = 20 # X-axis font size
$yAxisFontSize = 20 # Y-axis font size

$chart.Axes(1, [Microsoft.Office.Interop.Excel.XlAxisGroup]::xlPrimary).TickLabels.Font.Size = $xAxisFontSize
$chart.Axes(2, [Microsoft.Office.Interop.Excel.XlAxisGroup]::xlPrimary).TickLabels.Font.Size = $yAxisFontSize

# Customize axis font names
$xAxisFontName = "Times New Roman" # X-axis font name
$yAxisFontName = "Times New Roman" # Y-axis font name

$chart.Axes(1, [Microsoft.Office.Interop.Excel.XlAxisGroup]::xlPrimary).TickLabels.Font.Name = $xAxisFontName
$chart.Axes(2, [Microsoft.Office.Interop.Excel.XlAxisGroup]::xlPrimary).TickLabels.Font.Name = $yAxisFontName


# Remove the legend
$chart.HasLegend = $false
