$packageName = 'BoxCryptorClassic'
try {
	Uninstall-ChocolateyPackage "$packageName" 'MSI' '{DF47AB90-FB92-42F4-926E-1C4FF16029E7} /quiet /norestart' -validExitCodes @(0,3010)
	Write-ChocolateySuccess "$packageName"
} catch {
	Write-ChocolateyFailure "$packageName" $($_.Exception.Message)
	throw
}