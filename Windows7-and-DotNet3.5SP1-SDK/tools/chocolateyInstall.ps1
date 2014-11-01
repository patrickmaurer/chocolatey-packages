try {
	$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

	Get-ChocolateyWebFile 'Windows7-and-DotNet3.5SP1-SDK' "$toolsDir\GRMSDK_EN_DVD.iso" `
		'http://download.microsoft.com/download/2/E/9/2E911956-F90F-4BFB-8231-E292A7B6F287/GRMSDK_EN_DVD.iso' `
		'http://download.microsoft.com/download/2/E/9/2E911956-F90F-4BFB-8231-E292A7B6F287/GRMSDKX_EN_DVD.iso' `
		-checksum '8695F5E6810D84153181695DA78850988A923F4E' -checksumType 'sha1' `
		-checksum64 '3393C98B8468CB3505557854922707510F8B65E1' -checksumType64 'sha1'
	Start-Process "$toolsDir\7z.exe" -ArgumentList "x -o`"$toolsDir\GRMSDK_EN_DVD`" -y `"$toolsDir\GRMSDK_EN_DVD.iso`"" -Wait -WindowStyle Hidden -PassThru
	Remove-Item "$toolsDir\GRMSDK_EN_DVD.iso"

	Install-ChocolateyInstallPackage 'Windows7-and-DotNet3.5SP1-SDK' 'EXE' "-q -params:ADDLOCAL=ALL" "$toolsDir\GRMSDK_EN_DVD\setup.exe" -validExitCodes @(0,3010)
	Remove-Item "$toolsDir\GRMSDK_EN_DVD" -recurse

	Write-ChocolateySuccess 'Windows7-and-DotNet3.5SP1-SDK'
} catch {
	Write-ChocolateyFailure 'Windows7-and-DotNet3.5SP1-SDK' "$($_.Exception.Message)"
	throw
}