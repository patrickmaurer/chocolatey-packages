$app = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -match "OpenOffice 4.1.1" }
$app.Uninstall()