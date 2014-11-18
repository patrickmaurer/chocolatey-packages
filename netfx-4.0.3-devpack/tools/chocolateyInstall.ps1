$packageName = 'netfx-4.0.3-devpack'
$installerType = 'EXE'
$32BitUrl = 'http://download.microsoft.com/download/3/B/2/3B229A81-1413-45C6-9BFE-259D90606FD6/netfx_403mtpack.exe'
$silentArgs = "/Quiet /NoRestart /Log $($env:temp)\netfx-4.0.3-devpack.log"
$validExitCodes = @(0,3010)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes