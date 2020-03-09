$packageName = 'boxcryptor'
$installerType = 'MSI'
$url = 'https://downloads.boxcryptor.com//boxcryptor/windows/Boxcryptor_v2.38.1080_Setup.msi'
$checksum = '59664AE836130D447F5A3B92EE769FC827BDDA9CA2B55D6EB0755A3200C54ACE'
$checksumType = 'sha256'
$silentArgs = "/Quiet /NoRestart /Log ""$($env:temp)\boxcryptor-2.38.1080-install.log"""
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -checksum "$checksum" -checksumType "$checksumType" -validExitCodes $validExitCodes