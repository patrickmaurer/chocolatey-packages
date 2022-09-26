$packageName = 'myphoneexplorer'
$installerType = 'EXE'
$32BitUrl = 'https://www.fjsoft.at/files/MyPhoneExplorer_Setup_2.0.exe'
$checksum = '89F75F28AB0FA1CABC67DD90889977ECD2C2B0B71274373C5D64B6ABBE101305'
$checksumType = 'sha256'
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes