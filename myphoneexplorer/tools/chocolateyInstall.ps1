$packageName = 'myphoneexplorer'
$installerType = 'EXE'
$32BitUrl = 'https://www.fjsoft.at/files/MyPhoneExplorer_Setup_1.8.12.exe'
$checksum = '5fc9fb3e62e4ae34156e9211da822ea1970b5129'
$checksumType = 'sha1'
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes