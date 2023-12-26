$packageName = 'myphoneexplorer'
$installerType = 'EXE'
$32BitUrl = 'https://www.fjsoft.at/files/MyPhoneExplorer_Setup_2.1.exe'
$checksum = 'DD7CBF4A6C999E96D0338A1BE1EE48F920ACCD43AD6D9DCE1DA12C2D458E17C3'
$checksumType = 'sha256'
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes