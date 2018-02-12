$packageName = 'fxcop'
$installerType = 'EXE'
$url = 'https://codeplexarchive.blob.core.windows.net/archive/projects/FxCopInstaller/FxCopInstaller.zip'
$checksum = 'F157404789C1B722345BDE4553A98F302A3B6F624F0CBFE2B0A1A666F7BBE2A5'
$checksumType = 'sha256'
$silentArgs = '/Q'
$validExitCodes = @(0)

$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage $packageName $url $unzipLocation

Install-ChocolateyInstallPackage $packageName $installerType $silentArgs "$unzipLocation\sourceCode\fxcopinstaller\WinSDK_FxCopSetup.exe" `
	-checksum $checksum `
	-checksumType $checksumType `
	-validExitCodes $validExitCodes

Remove-Item "$toolsDir\discussions" -recurse
Remove-Item "$toolsDir\issues" -recurse
Remove-Item "$toolsDir\license" -recurse
Remove-Item "$toolsDir\releases" -recurse
Remove-Item "$toolsDir\sourceCode" -recurse
Remove-Item "$toolsDir\wiki" -recurse
