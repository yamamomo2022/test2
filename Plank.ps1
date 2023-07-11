# 必要なライブラリを読み込む
Add-Type -TypeDefinition @"
    using System;

    public static class PlanckDistribution
    {
        public static double GetValue(double wavelength, double temperature)
        {
            const double BoltzmannConstant = 1.38064852e-23;
            const double SpeedOfLight = 299792458;
            const double PlanckConstant = 6.62607004e-34;

            double exponent = (PlanckConstant * SpeedOfLight) / (wavelength * BoltzmannConstant * temperature);
            return (2 * PlanckConstant * Math.Pow(SpeedOfLight, 2)) / (Math.Pow(wavelength, 5) * (Math.Exp(exponent) - 1));
        }
    }
"@

# プランク分布のパラメータ
$temperature = 5000  # 温度（ケルビン）
$wavelengths = 400..700  # 波長の範囲（nm）

# プランク分布の値を計算
$distribution = @{}
foreach ($wavelength in $wavelengths) {
    $value = [PlanckDistribution]::GetValue($wavelength * 1e-9, $temperature)
    $distribution[$wavelength] = $value
}

# Excelオブジェクトの作成
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $true

# ワークブックの作成
$workbook = $excel.Workbooks.Add()

# ワークシートの作成
$worksheet = $workbook.Worksheets.Add()

# データをワークシートに書き込む
$worksheet.Cells.Item(1, 1) = "Wavelength (nm)"
$worksheet.Cells.Item(1, 2) = "Planck Distribution"

$row = 2
foreach ($wavelength in $wavelengths) {
    $worksheet.Cells.Item($row, 1) = $wavelength
    $worksheet.Cells.Item($row, 2) = $distribution[$wavelength]
    $row++
}

# グラフの作成
$chart = $worksheet.Shapes.AddChart().Chart
$chart.ChartType = [Microsoft.Office.Interop.Excel.XlChartType]::xlLine

# データ範囲を指定
$dataRange = $worksheet.Range("A1:B$row")
$chart.SetSourceData($dataRange)

# グラフの表示
$chart.Location([Microsoft.Office.Interop.Excel.XlChartLocation]::xlLocationAsObject, $worksheet.Name)

# グラフのタイトル設定
$chart.HasTitle = $true
$chart.ChartTitle.Text = "Planck Distribution (Temperature: $temperature K)"

# X軸のタイトル設定
$chart.Axes([Microsoft.Office.Interop.Excel.XlAxisType]::xlCategory).HasTitle = $true
$chart.Axes([Microsoft.Office.Interop.Excel.XlAxisType]::xlCategory).AxisTitle.Text = "Wavelength (nm)"

# Y軸のタイトル設定
$chart.Axes([Microsoft.Office.Interop.Excel.XlAxisType]::xlValue).HasTitle = $true
$chart.Axes([Microsoft.Office.Interop.Excel.XlAxisType]::xlValue).AxisTitle.Text = "Planck Distribution"

# ワークブックを保存
$workbook.SaveAs("C:\path\to\output.xlsx")

# Excelオブジェクトの解放
$workbook.Close()
$excel.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($dataRange) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($chart) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($worksheet) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($workbook) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
Remove-Variable excel, workbook, worksheet, dataRange, chart

