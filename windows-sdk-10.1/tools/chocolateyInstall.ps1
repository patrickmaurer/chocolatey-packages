$packageName = 'windows-sdk-10.1'
$installerType = 'EXE'
$url = 'https://download.microsoft.com/download/9/3/9/939441D4-6FBA-48EE-9EF7-402C1AA8B8A7/windowssdk/winsdksetup.exe'
$checksum = '8C804DFF709D197119D721CC1C6B7DFDEF581B0D708A371A6B1286FC409BAE18'
$checksumType = 'sha256'
$silentArgs = "/Quiet /NoRestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
$validExitCodes = @(0,3010)
Install-ChocolateyPackage $packageName $installerType $silentArgs $url -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes