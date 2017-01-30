$packageName = 'myphoneexplorer'
$installerType = 'EXE'
$32BitUrl = 'http://www.fjsoft.at/files/MyPhoneExplorer_Setup_1.8.8.exe'
$checksum = '9af3ce782a459063c15959918dcda6ba5cf813c212ef8c5a2607d26b8b1a9e5d'
$checksumType = 'sha256'
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes