$packageName = 'netfx-4.6-devpack'
$installerType = 'EXE'
$url = 'http://download.microsoft.com/download/8/2/F/82FF2034-83E6-4F93-900D-F88C7AD9F3EE/NDP46-TargetingPack-KB3045566.exe'
$silentArgs = "/Quiet /NoRestart /Log $($env:temp)\netfx-4.6-devpack.log"
$validExitCodes = @(0,3010)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes