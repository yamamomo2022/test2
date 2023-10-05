# 出力するテキストファイルのパスを指定
$outputFile = $HOME+"\desktop\output.txt"

# 10分間 = 600秒、5秒ごとのサンプルなので120回のループ
for ($i=0; $i -lt 120; $i++) {
    # CPU使用率の取得
    $cpuLoad = (Get-Counter -Counter "\Processor(_Total)\% Processor Time" -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue

    # メモリ使用率の取得
    $totalMemory = (Get-CimInstance -ClassName Win32_ComputerSystem).TotalPhysicalMemory / 1GB
    $usedMemory = $totalMemory - ((Get-Counter -Counter "\Memory\Available MBytes" -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue / 1024)
    $memoryLoad = ($usedMemory / $totalMemory) * 100

    # ディスク使用率の取得
    $diskRead = (Get-Counter -Counter "\PhysicalDisk(_Total)\Disk Read Bytes/sec" -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue
    $diskWrite = (Get-Counter -Counter "\PhysicalDisk(_Total)\Disk Write Bytes/sec" -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue

    # ネットワーク使用率の取得
    $networkReceived = (Get-Counter -Counter "\Network Interface(_Total)\Bytes Received/sec" -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue
    $networkSent = (Get-Counter -Counter "\Network Interface(_Total)\Bytes Sent/sec" -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue

    # 結果をテキストファイルに書き込む
    Add-Content -Path $outputFile -Value "Time: $(Get-Date) CPU Load: $([Math]::Round($cpuLoad, 2))% Memory Load: $([Math]::Round($memoryLoad, 2))% Disk Read: $([Math]::Round($diskRead / 1MB, 2)) MB/s Disk Write: $([Math]::Round($diskWrite / 1MB, 2)) MB/s Network Received: $([Math]::Round($networkReceived / 1MB, 2)) MB/s Network Sent: $([Math]::Round($networkSent / 1MB, 2)) MB/s"

    # 5秒間の間隔を設ける
    Start-Sleep -Seconds 5
}
