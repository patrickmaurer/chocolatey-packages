$packageName = 'boxcryptor'
$installerType = 'MSI'
$url = 'https://downloads.boxcryptor.com//boxcryptor/windows/Boxcryptor_v2.37.1057_Setup.msi'
$checksum = 'C1854A791EAB366D3D440FB461DD9BBD4A2E930B3F39AFC84CB3F9A91996CFE6'
$checksumType = 'sha256'
$silentArgs = "/Quiet /NoRestart /Log ""$($env:temp)\boxcryptor-2.37.1057-install.log"""
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -checksum "$checksum" -checksumType "$checksumType" -validExitCodes $validExitCodes