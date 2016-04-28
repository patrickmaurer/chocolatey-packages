$packageName = 'boxcryptor'
$installerType = 'MSI'
$url = 'https://d3k3ih5otj72mn.cloudfront.net/Boxcryptor_v2.2.423.322_Setup.msi'
$silentArgs = "/Quiet /NoRestart /Log ""$($env:temp)\boxcryptor-2.2.423.322-install.log"""
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes