# Excelオブジェクトを作成
$excel = New-Object -ComObject Excel.Application

# Excelアプリケーションを非表示にする（任意）
$excel.Visible = $false

# 新しいワークブックを作成
$workbook = $excel.Workbooks.Add()

# 新しいシートを作成
$worksheet = $workbook.Worksheets.Add()

# シートの名前を設定
$worksheet.Name = "MySheet"

# データをセルに書き込む
$worksheet.Cells.Item(1, 1) = "Hello"
$worksheet.Cells.Item(1, 2) = "World!"

# セルの値を読み取る
$cellValue = $worksheet.Cells.Item(1, 1).Value

# 列幅を調整（任意）
$worksheet.Columns.Item(1).AutoFit()

# ワークブックを保存
$workbook.SaveAs("C:\path\to\output.xlsx")

# ワークブックを閉じる
$workbook.Close()

# Excelアプリケーションを終了
$excel.Quit()

# リソースの解放
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($worksheet) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($workbook) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

Write-Host "Excel自動化が完了しました。"


# Excelオブジェクトを作成
$excel = New-Object -ComObject Excel.Application

# Excelアプリケーションを非表示にする（任意）
$excel.Visible = $false

# 新しいワークブックを作成
$workbook = $excel.Workbooks.Add()

# 新しいシートを作成
$worksheet = $workbook.Worksheets.Add()

# シートの名前を設定
$worksheet.Name = "MySheet"

# データを配列で用意
$data = @(
    @("Name", "Age", "City"),
    @("John", 30, "New York"),
    @("Alice", 25, "Los Angeles"),
    @("Bob", 40, "Chicago")
)

# データをセルに挿入
$startingRow = 1
$startingColumn = 1

foreach ($rowIndex in 0..($data.Length - 1)) {
    $rowData = $data[$rowIndex]
    foreach ($columnIndex in 0..($rowData.Length - 1)) {
        $cellValue = $rowData[$columnIndex]
        $worksheet.Cells.Item($startingRow + $rowIndex, $startingColumn + $columnIndex) = $cellValue
    }
}

# セルの値を読み取る
$cellValue = $worksheet.Cells.Item(2, 2).Value

# 列幅を調整
$worksheet.Columns.AutoFit()

# セルを書式設定
$boldFont = $worksheet.Cells.Item(1, 1).Font
$boldFont.Bold = $true

# フィルタリングを追加
$usedRange = $worksheet.UsedRange
$usedRange.AutoFilter()

# ワークブックを保存
$workbook.SaveAs("C:\path\to\output.xlsx")

# ワークブックを閉じる
$workbook.Close()

# Excelアプリケーションを終了
$excel.Quit()

# リソースの解放
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($worksheet) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($workbook) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

Write-Host "Excel表の操作が完了しました。"
