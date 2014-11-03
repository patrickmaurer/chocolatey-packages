try {
	$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

	Get-ChocolateyWebFile 'windows-sdk-6.0' "$toolsDir\WindowsSDK_Vista_Feb2007Update_rtm.DVD.Rel.iso" `
		'http://download.microsoft.com/download/4/2/6/42684501-9ec5-43dd-9dfe-c8c9dfa6a66f/6.1.6000.16384.10.WindowsSDK_Vista_Feb2007Update_rtm.DVD.Rel.iso'
	Start-Process "$toolsDir\7z.exe" -ArgumentList "x -o`"$toolsDir\WinSDK_Vista_rtm`" -y `"$toolsDir\WindowsSDK_Vista_Feb2007Update_rtm.DVD.Rel.iso`"" -Wait -WindowStyle Hidden -PassThru
	Remove-Item "$toolsDir\WindowsSDK_Vista_Feb2007Update_rtm.DVD.Rel.iso"

	Install-ChocolateyInstallPackage 'windows-sdk-6.0' 'EXE' "-q -params:ADDLOCAL=ALL" "$toolsDir\WinSDK_Vista_rtm\Setup.Exe" -validExitCodes @(0,3010)
	Remove-Item "$toolsDir\WinSDK_Vista_rtm" -recurse

	Write-ChocolateySuccess 'windows-sdk-6.0'
} catch {
	Write-ChocolateyFailure 'windows-sdk-6.0' "$($_.Exception.Message)"
	throw
}