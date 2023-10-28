# データの追加
$data = @"
ID,Name,Age
1,John Doe,28
2,Jane Smith,30
3,Robert Brown,25
"@

$data | Out-File -Encoding utf8 "./database.csv"


$users = Import-Csv "database.csv"

# $users | Format-Table -AutoSize

# IDが2のユーザーの年齢を更新
$users | ForEach-Object {
    if ($_.ID -eq 2) {
        $_.Age = 31
    }
}
$users | Export-Csv "database.csv" -NoTypeInformation

