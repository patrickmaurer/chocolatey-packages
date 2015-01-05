$packageName = 'boxcryptor'
try {
	Uninstall-ChocolateyPackage "$packageName" 'MSI' '{0511514A-A672-4F79-8151-D70CA84BF044} /quiet /norestart' -validExitCodes @(0,3010)
	Write-ChocolateySuccess "$packageName"
} catch {
	Write-ChocolateyFailure "$packageName" $($_.Exception.Message)
	throw
}