$packageName = 'adb'
$url = 'https://dl-ssl.google.com/android/repository/platform-tools_r23-windows.zip'
$checksum = '52b4816990d2d18a34645bbf20a31b38a7859d4c'
$checksumType = 'sha1'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Install-ChocolateyZipPackage $packageName $url $unzipLocation -checksum $checksum -checksumType $checksumType -checksumType64 $checksumType

Remove-Item "$unzipLocation\platform-tools\api" -recurse
Remove-Item "$unzipLocation\platform-tools\systrace" -recurse
Remove-Item "$unzipLocation\platform-tools\dmtracedump.exe"
Remove-Item "$unzipLocation\platform-tools\etc1tool.exe"
Remove-Item "$unzipLocation\platform-tools\hprof-conv.exe"
Remove-Item "$unzipLocation\platform-tools\source.properties"
Remove-Item "$unzipLocation\platform-tools\sqlite3.exe"