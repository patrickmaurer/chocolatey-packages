$packageName = 'h2testw'
$url = 'ftp://ftp.heise.de/pub/ct/ctsi/h2testw_1.4.zip'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Install-ChocolateyZipPackage $packageName $url $unzipLocation
Install-ChocolateyShortcut -shortcutFilePath "$($env:ProgramData)\Microsoft\Windows\Start Menu\H2testw.lnk" -targetPath "$unzipLocation\h2testw.exe"