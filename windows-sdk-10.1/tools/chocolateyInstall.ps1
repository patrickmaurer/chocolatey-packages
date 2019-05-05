$packageName = 'windows-sdk-10.1'
$installerType = 'EXE'
$url = 'https://download.microsoft.com/download/4/2/2/42245968-6A79-4DA7-A5FB-08C0AD0AE661/windowssdk/winsdksetup.exe'
$checksum = '2E28117E82B4D02FE30D564B835ACE9976612609271265872F20F2256A9C506B'
$checksumType = 'sha256'
$silentArgs = "/Quiet /NoRestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
$validExitCodes = @(0,3010)
Install-ChocolateyPackage $packageName $installerType $silentArgs $url -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes