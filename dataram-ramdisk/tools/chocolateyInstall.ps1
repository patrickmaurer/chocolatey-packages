$packageName = 'dataram-ramdisk'
$installerType = 'MSI'
$url = 'http://memory.dataram.com/__downloads/memory/ramdisk/Dataram_RAMDisk_4_4_0_RC32.msi'
$silentArgs = '/quiet /norestart'
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes