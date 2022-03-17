$packageName = 'boxcryptor'
$installerType = 'MSI'
$url = 'https://downloads.boxcryptor.com//boxcryptor/windows/Boxcryptor_v2.50.2196_Setup.msi'
$checksum = '925B88E574981BDDE82BE6ABE6DB99D2A1B9D69AB6C68EC23FAD487CDC710F6C'
$checksumType = 'sha256'
$silentArgs = "/Quiet /NoRestart /Log ""$($env:temp)\boxcryptor-2.50.2196-install.log"""
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -checksum "$checksum" -checksumType "$checksumType" -validExitCodes $validExitCodes