$packageName = 'netfx-4.0.2-devpack'
$installerType = 'EXE'
$32BitUrl = 'http://download.microsoft.com/download/B/B/3/BB301D35-9D08-4012-B2F6-95823DFD3CEF/netfx_402mtpack.exe'
$silentArgs = "/Quiet /NoRestart /Log $($env:temp)\netfx-4.0.2-devpack.log"
$validExitCodes = @(0,3010)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes