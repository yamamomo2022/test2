function Calc-Sum($p1, $p2) {
	$sum = $p1 + $p2 + [math]::PI
	return($sum)
}

$n = Calc-Sum ($p1=2) ($p2=0)

Write-Host $n  # 5
Write-Host ([math]::PI)




