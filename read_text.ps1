$text = Get-Content name_excel.txt  -RAW  -Encoding UTF8

$text.gettype()

$excel = New-Object -ComObject Excel.Application 
$excel.Visible = $true
$wb = $excel.Workbooks.Add()
$sheet = $wb.Sheets("Sheet1") 

$row = 1
$column = 1

#$text.Split(',')

foreach ($char in $text.tochararray()) {
        echo $char
        
        $sheet.Cells.Item($row,$column) = $char

        $row++

}

