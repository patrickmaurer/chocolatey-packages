$packageName = 'boxcryptor'
$installerType = 'MSI'
$url = 'https://d3k3ih5otj72mn.cloudfront.net/boxcryptor/windows/Boxcryptor_v2.7.503_Setup.msi'
$checksum = '8DCD9405A30EDC1562977884F3C8342DA66EACD5A80D29E7690AEA58A62A2030'
$checksumType = 'sha256'
$silentArgs = "/Quiet /NoRestart /Log ""$($env:temp)\boxcryptor-2.7.503-install.log"""
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -checksum "$checksum" -checksumType "$checksumType" -validExitCodes $validExitCodes