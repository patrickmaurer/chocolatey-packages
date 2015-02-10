$packageName = 'tcptunnel'
$url = 'http://www.vakuumverpackt.de/tcptunnel/tcptunnel-0.8.zip'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

try {
	Install-ChocolateyZipPackage $packageName $url $unzipLocation

	Move-Item "$unzipLocation\tcptunnel-0.8\*" $unzipLocation
	Remove-Item "$unzipLocation\tcptunnel-0.8" -recurse

	Write-ChocolateySuccess 'tcptunnel'
} catch {
	Write-ChocolateyFailure 'tcptunnel' "$($_.Exception.Message)"
	throw
}