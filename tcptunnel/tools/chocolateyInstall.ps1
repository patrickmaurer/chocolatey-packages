$packageName = 'tcptunnel'
$url = 'http://www.vakuumverpackt.de/tcptunnel/tcptunnel-0.8.zip'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Install-ChocolateyZipPackage $packageName $url $unzipLocation