$packageName = 'myphoneexplorer'
$installerType = 'EXE'
$32BitUrl = 'https://www.fjsoft.at/files/MyPhoneExplorer_Setup_1.9.0.exe'
$checksum = '1E26347C80CAF9F31BDBA7EF1C4CEAA0761F5CCF8409282003029499D1282C58'
$checksumType = 'sha256'
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes