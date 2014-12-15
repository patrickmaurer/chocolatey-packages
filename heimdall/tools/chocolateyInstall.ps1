$packageName = 'heimdall'
$url = 'https://bitbucket.org/benjamin_dobell/heimdall/downloads/heimdall-suite-1.4.0-win32.zip'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage $packageName $url $unzipLocation
Install-ChocolateyDesktopLink -TargetFilePath "$unzipLocation\Heimdall Suite\heimdall-frontend.exe"