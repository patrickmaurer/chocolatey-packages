$packageName = 'myphoneexplorer'
$installerType = 'EXE'
$32BitUrl = 'https://www.fjsoft.at/files/MyPhoneExplorer_Setup_1.8.14.exe'
$checksum = '8eb9beb55fb7080b5c9fa1b3c4a7cc9fe8cf89a9'
$checksumType = 'sha1'
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes