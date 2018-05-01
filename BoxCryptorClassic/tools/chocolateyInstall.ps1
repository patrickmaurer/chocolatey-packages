$packageName = 'BoxCryptorClassic'
$installerType = 'MSI'
$url = 'https://downloads.boxcryptor.com/Boxcryptor_Classic_v1.7.409.131_Setup.msi'
$checksum = '02B381A27F8B11C7F05AFC859C0FA9B260EC764E52CFB7600C94F4964C97A11F'
$checksumType = 'sha256'
$silentArgs = "/Quiet /NoRestart /Log ""$($env:temp)\boxcryptor-classic-v1.7.409.131-install.log"""
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -checksum "$checksum" -checksumType "$checksumType" -validExitCodes $validExitCodes