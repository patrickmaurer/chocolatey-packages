$packageName = 'netfx-4.5.1-devpack'
$installerType = 'EXE'
$32BitUrl = 'http://download.microsoft.com/download/9/6/0/96075294-6820-4F01-924A-474E0023E407/NDP451-KB2861696-x86-x64-DevPack.exe'
$silentArgs = "/Quiet /NoRestart /Log $($env:temp)\netfx-4.5.1-devpack.log"
$validExitCodes = @(0,3010)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes