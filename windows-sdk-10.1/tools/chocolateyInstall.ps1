$packageName = 'windows-sdk-10.1'
$installerType = 'EXE'
$url = 'https://download.microsoft.com/download/E/1/B/E1B0E6C0-2FA2-4A1B-B322-714A5586BE63/windowssdk/winsdksetup.exe'
$checksum = '56ADAA1B131D819693B93060D3D14506C246FECD'
$checksumType = 'sha1'
$silentArgs = "/Quiet /NoRestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
$validExitCodes = @(0,3010)
Install-ChocolateyPackage $packageName $installerType $silentArgs $url -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes