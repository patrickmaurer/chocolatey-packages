$packageName = 'netfx-4.0.3-devpack'
$installerType = 'EXE'
$url = 'https://download.microsoft.com/download/3/B/2/3B229A81-1413-45C6-9BFE-259D90606FD6/netfx_403mtpack.exe'
$checksum = 'D8BA2E61E2F0E5D39668BB0564BAE4EA4E2AC82108525B3B3307F3C1EE8F8295'
$checksumType = 'sha256'
$silentArgs = "/Quiet /NoRestart /Log $($env:temp)\netfx-4.0.3-devpack.log"
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -checksum "$checksum" -checksumType "$checksumType" -validExitCodes $validExitCodes