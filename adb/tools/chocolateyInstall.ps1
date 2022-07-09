$packageName = 'adb'
$url = 'https://dl.google.com/android/repository/platform-tools_r33.0.2-windows.zip'
$checksum = 'C8CD6757416CC31B0D838A9D294EDA13863450D156FFA45C29DCDB2BCD7F08FE'
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