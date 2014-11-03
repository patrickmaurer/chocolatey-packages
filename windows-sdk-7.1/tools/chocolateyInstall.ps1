try {
	$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

	Get-ChocolateyWebFile 'windows7-and-dotnet4.0-sdk' "$toolsDir\GRMSDK_EN_DVD.iso" `
		'http://download.microsoft.com/download/F/1/0/F10113F5-B750-4969-A255-274341AC6BCE/GRMSDK_EN_DVD.iso' `
		'http://download.microsoft.com/download/F/1/0/F10113F5-B750-4969-A255-274341AC6BCE/GRMSDKX_EN_DVD.iso' `
		-checksum 'CDE254E83677C34C8FD509D6B733C32002FE3572' -checksumType 'sha1' `
		-checksum64 '9203529F5F70D556A60C37F118A95214E6D10B5A' -checksumType64 'sha1'
	Start-Process "$toolsDir\7z.exe" -ArgumentList "x -o`"$toolsDir\GRMSDK_EN_DVD`" -y `"$toolsDir\GRMSDK_EN_DVD.iso`"" -Wait -WindowStyle Hidden -PassThru
	Remove-Item "$toolsDir\GRMSDK_EN_DVD.iso"

	Install-ChocolateyInstallPackage 'windows7-and-dotnet4.0-sdk' 'EXE' "-q -params:ADDLOCAL=ALL" "$toolsDir\GRMSDK_EN_DVD\setup.exe" -validExitCodes @(0,3010)
	Remove-Item "$toolsDir\GRMSDK_EN_DVD" -recurse

	Write-ChocolateySuccess 'windows7-and-dotnet4.0-sdk'
} catch {
	Write-ChocolateyFailure 'windows7-and-dotnet4.0-sdk' "$($_.Exception.Message)"
	throw
}