$packageName = 'boxcryptor'
$installerType = 'MSI'
$url = 'https://downloads.boxcryptor.com//boxcryptor/windows/Boxcryptor_v2.15.578_Setup.msi'
$checksum = 'A39FAE01DA645FE99107AB6AC1B27E46DE9C3032DFE36312DACB4D6F4C0CC3EC'
$checksumType = 'sha256'
$silentArgs = "/Quiet /NoRestart /Log ""$($env:temp)\boxcryptor-2.15.578-install.log"""
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -checksum "$checksum" -checksumType "$checksumType" -validExitCodes $validExitCodes