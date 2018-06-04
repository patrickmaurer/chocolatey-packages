$packageName = 'boxcryptor'
$installerType = 'MSI'
$url = 'https://downloads.boxcryptor.com//boxcryptor/windows/Boxcryptor_v2.29.799_Setup.msi'
$checksum = '1ABAA56A3FC01F5C84BB6C097F94057DA582783F49565FD673A51035A775312C'
$checksumType = 'sha256'
$silentArgs = "/Quiet /NoRestart /Log ""$($env:temp)\boxcryptor-2.29.799-install.log"""
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -checksum "$checksum" -checksumType "$checksumType" -validExitCodes $validExitCodes