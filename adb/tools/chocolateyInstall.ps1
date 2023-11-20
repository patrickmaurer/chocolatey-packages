$packageName = 'adb'
$url = 'https://dl.google.com/android/repository/platform-tools_r34.0.5-windows.zip'
$checksum = '3F8320152704377DE150418A3C4C9D07D16D80A6C0D0D8F7289C22C499E33571'
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

Remove-Item "$unzipLocation\platform-tools\dmtracedump.exe"
Remove-Item "$unzipLocation\platform-tools\etc1tool.exe"
Remove-Item "$unzipLocation\platform-tools\hprof-conv.exe"
Remove-Item "$unzipLocation\platform-tools\source.properties"
Remove-Item "$unzipLocation\platform-tools\sqlite3.exe"
Remove-Item "$unzipLocation\platform-tools\make_f2fs.exe"
Remove-Item "$unzipLocation\platform-tools\make_f2fs_casefold.exe"
Remove-Item "$unzipLocation\platform-tools\mke2fs.conf"
Remove-Item "$unzipLocation\platform-tools\mke2fs.exe"