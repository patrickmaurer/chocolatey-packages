$packageName = 'tcptunnel'
$url = 'http://www.vakuumverpackt.de/tcptunnel/tcptunnel-0.8.zip'
$checksum = 'FF3E6346D179D9AA6877AF087A557F68EBE3440B4CF23EB920FF476E186A8005'
$checksumType = 'sha256'

$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Install-ChocolateyZipPackage $packageName $url $unzipLocation `
	-checksum $checksum `
	-checksumType $checksumType