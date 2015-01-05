$packageName = 'BoxCryptorClassic'
$installerType = 'MSI'
$32BitUrl = 'https://d3k3ih5otj72mn.cloudfront.net/Boxcryptor_Classic_v1.7.409.131_Setup.msi'
$silentArgs = '/quiet /norestart'
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes