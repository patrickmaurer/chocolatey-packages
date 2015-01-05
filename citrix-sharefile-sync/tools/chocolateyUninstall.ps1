$app = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -match "Citrix ShareFile Sync" -and ($_.Version -eq "3.2.109.0") }
$app.Uninstall()