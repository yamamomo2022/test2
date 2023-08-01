# Outlookアプリケーションオブジェクトの作成
$Outlook = New-Object -ComObject Outlook.Application

# OutlookのNameSpaceオブジェクトを取得
$Namespace = $Outlook.GetNamespace("MAPI")

# コマンドレットの一覧を表示
$Namespace | Get-Member -MemberType Method,Property | Select-Object Name

# Outlookの終了
$Outlook.Quit()

# メールを作成して送信する例
$Outlook = New-Object -ComObject Outlook.Application
$MailItem = $Outlook.CreateItem(0) # 0はolMailItemを意味します（新しいメール作成）
$MailItem.To = "recipient@example.com"
$MailItem.Subject = "メールの件名"
$MailItem.Body = "メールの本文"
$MailItem.Send()
$Outlook.Quit()

# 受信トレイのメールを取得して表示する例
$Outlook = New-Object -ComObject Outlook.Application
$Namespace = $Outlook.GetNamespace("MAPI")
$Inbox = $Namespace.GetDefaultFolder(6) # 6はolFolderInboxを意味します（受信トレイ）
$Inbox.Items | ForEach-Object {
    Write-Host "件名: $($_.Subject)"
    Write-Host "差出人: $($_.SenderName)"
}
$Outlook.Quit()

# Outlookアプリケーションオブジェクトの作成
$Outlook = New-Object -ComObject Outlook.Application

# 受信トレイのメールを取得
$Namespace = $Outlook.GetNamespace("MAPI")
$Inbox = $Namespace.GetDefaultFolder(6) # 6はolFolderInboxを意味します（受信トレイ）

# 特定のキーワードを含むメールを検索して別のフォルダに移動
$TargetFolderName = "処理済み" # 処理済みフォルダの名前
$Keyword = "重要" # 特定のキーワード

$TargetFolder = $Namespace.Folders.Item(1).Folders.Item($TargetFolderName) # ルートフォルダの配下にある処理済みフォルダを取得

foreach ($MailItem in $Inbox.Items) {
    if ($MailItem.Subject -like "*$Keyword*") {
        $MailItem.Move($TargetFolder)
        Write-Host "メールを処理済みフォルダに移動しました: $($MailItem.Subject)"
    }
}

# Outlookの終了
$Outlook.Quit()
