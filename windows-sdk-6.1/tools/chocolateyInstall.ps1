$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Get-ChocolateyWebFile 'windows-sdk-6.1' "$toolsDir\KRMSDK_EN.iso" `
	'http://download.microsoft.com/download/f/e/6/fe6eb291-e187-4b06-ad78-bb45d066c30f/6.0.6001.18000.367-KRMSDK_EN.iso'
Start-Process "${Env:ProgramFiles}\7-Zip\7z.exe" -ArgumentList "x -o`"$toolsDir\KRMSDK_EN`" -y `"$toolsDir\KRMSDK_EN.iso`"" -Wait -WindowStyle Hidden -PassThru
Remove-Item "$toolsDir\KRMSDK_EN.iso"

Install-ChocolateyInstallPackage 'windows-sdk-6.1' 'EXE' "-q -params:ADDLOCAL=ALL" "$toolsDir\KRMSDK_EN\Setup.Exe" -validExitCodes @(0,3010)
Remove-Item "$toolsDir\KRMSDK_EN" -recurse