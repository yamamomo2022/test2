Sub SendScheduledEmail()
    Dim SendDate As Date
    Dim Recipient As String
    Dim Subject As String
    Dim MailBody As String
    Dim OutlookApp As Object
    Dim OutlookMail As Object
    
    ' 送信する日時を指定（例：2023年7月31日午後3時）
    SendDate = #7/31/2023 3:00:00 PM#
    
    ' 宛先メールアドレス、件名、本文を指定
    Recipient = "recipient@example.com"
    Subject = "スケジュールされたメールのテスト"
    MailBody = "これはスケジュールされたメールのテストです。"
    
    ' Outlookアプリケーションを作成
    Set OutlookApp = CreateObject("Outlook.Application")
    
    ' 新しいメールアイテムを作成
    Set OutlookMail = OutlookApp.CreateItem(0)
    
    ' メールの設定
    With OutlookMail
        .To = Recipient
        .Subject = Subject
        .Body = MailBody
        .SendOnBehalfOfName = "your_email_address@example.com" ' 自分のメールアドレスを指定
    End With
    
    ' メールの送信をスケジュール
    OutlookMail.DeferredDeliveryTime = SendDate
    OutlookMail.Send
End Sub
