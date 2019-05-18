$packageName = 'adb'
$url = 'https://dl-ssl.google.com/android/repository/platform-tools_r28.0.3-windows.zip'
$checksum = '0FDBC4BCBFCC2B9437F36D7C17CF7BB318532221DE54C7E71FC980F05F51BCBF'
$checksumType = 'sha256'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$existingAdb = Get-Command -Name adb.exe -ErrorAction SilentlyContinue
if (($existingAdb -ne $null) -and ($existingAdb.Path.StartsWith($env:ChocolateyInstall) -eq $false)) {
	Write-Warning "adb.exe already exists: $($existingAdb.Path)"
}

$existingFastboot = Get-Command -Name fastboot.exe -ErrorAction SilentlyContinue
if (($existingFastboot -ne $null) -and ($existingFastboot.Path.StartsWith($env:ChocolateyInstall) -eq $false)) {
	Write-Warning "fastboot.exe already exists: $($existingFastboot.Path)"
}

Install-ChocolateyZipPackage $packageName $url $unzipLocation -checksum $checksum -checksumType $checksumType -checksumType64 $checksumType

Remove-Item "$unzipLocation\platform-tools\api" -recurse
Remove-Item "$unzipLocation\platform-tools\systrace" -recurse
Remove-Item "$unzipLocation\platform-tools\dmtracedump.exe"
Remove-Item "$unzipLocation\platform-tools\etc1tool.exe"
Remove-Item "$unzipLocation\platform-tools\hprof-conv.exe"
Remove-Item "$unzipLocation\platform-tools\source.properties"
Remove-Item "$unzipLocation\platform-tools\sqlite3.exe"