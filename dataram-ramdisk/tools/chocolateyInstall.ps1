$packageName = 'dataram-ramdisk'
$installerType = 'MSI'
$url = 'http://memory.dataram.com/__downloads/memory/ramdisk/Dataram_RAMDisk_4_4_0_RC36.msi'
$checksum = 'EA7906A346AA437BD0F3C056F084D6BA2184F945A9F1993671FBC2D32A735636'
$checksumType = 'sha256'
$silentArgs = '/quiet /norestart'
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -checksum "$checksum" -checksumType "$checksumType" -validExitCodes $validExitCodes