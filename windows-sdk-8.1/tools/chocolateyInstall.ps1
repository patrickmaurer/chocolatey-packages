$packageName = 'windows-sdk-8.1'
$installerType = 'EXE'
$32BitUrl = 'http://download.microsoft.com/download/B/0/C/B0C80BA3-8AD6-4958-810B-6882485230B5/standalonesdk/sdksetup.exe'
$silentArgs = "/Quiet /NoRestart /Log $($env:temp)\windows-sdk-8.1.log"
$validExitCodes = @(0,3010)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes