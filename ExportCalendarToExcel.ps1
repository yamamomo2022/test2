Sub ExportCalendarToExcel()
    Dim OutlookApp As Object
    Dim OutlookNamespace As Object
    Dim OutlookCalendar As Object
    Dim OutlookAppointment As Object
    Dim ExcelApp As Object
    Dim ExcelWorkbook As Object
    Dim ExcelWorksheet As Object
    Dim RowCounter As Long
    
    ' Outlookアプリケーションを作成
    Set OutlookApp = CreateObject("Outlook.Application")
    
    ' Outlookの名前空間を取得
    Set OutlookNamespace = OutlookApp.GetNamespace("MAPI")
    
    ' カレンダーフォルダを取得
    Set OutlookCalendar = OutlookNamespace.GetDefaultFolder(9) ' 9はカレンダーフォルダを表す番号
    
    ' Excelアプリケーションを作成
    Set ExcelApp = CreateObject("Excel.Application")
    
    ' 新しいExcelブックを作成
    Set ExcelWorkbook = ExcelApp.Workbooks.Add
    
    ' Excelシートを選択（デフォルトの"Sheet1"を使用）
    Set ExcelWorksheet = ExcelWorkbook.Sheets("Sheet1")
    
    ' カレンダーの予定を取得してExcelに書き込む
    RowCounter = 1
    For Each OutlookAppointment In OutlookCalendar.Items
        If OutlookAppointment.Class = 26 Then ' 予定のクラスIDは26
            ' イベントの情報をExcelに書き込む（例として開始日時、件名、場所を出力）
            ExcelWorksheet.Cells(RowCounter, 1).Value = OutlookAppointment.Start
            ExcelWorksheet.Cells(RowCounter, 2).Value = OutlookAppointment.Subject
            ExcelWorksheet.Cells(RowCounter, 3).Value = OutlookAppointment.Location
            RowCounter = RowCounter + 1
        End If
    Next OutlookAppointment
    
    ' Excelファイルを保存（任意のファイルパスに保存する場合は指定してください）
    ExcelWorkbook.SaveAs "C:\path\to\your\output_file.xlsx"
    
    ' Excelアプリケーションを表示
    ExcelApp.Visible = True
    
    ' オブジェクトを解放
    Set OutlookAppointment = Nothing
    Set OutlookCalendar = Nothing
    Set OutlookNamespace = Nothing
    Set OutlookApp = Nothing
    Set ExcelWorksheet = Nothing
    Set ExcelWorkbook = Nothing
    Set ExcelApp = Nothing
End Sub
