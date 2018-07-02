$packageName = 'h2testw'
$url = 'ftp://ftp.heise.de/pub/ct/ctsi/h2testw_1.4.zip'
$checksum = '0D54B8BECA3BC2EBFAB543DBE793D52658D278538F9062B816FB77ABE2DAC187'
$checksumType = 'sha256'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Install-ChocolateyZipPackage $packageName $url $unzipLocation -checksum "$checksum" -checksumType "$checksumType"
Install-ChocolateyShortcut -shortcutFilePath "$($env:ProgramData)\Microsoft\Windows\Start Menu\H2testw.lnk" -targetPath "$unzipLocation\h2testw.exe"