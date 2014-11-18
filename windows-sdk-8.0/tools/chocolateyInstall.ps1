$packageName = 'windows-sdk-8.0'
$installerType = 'EXE'
$32BitUrl = 'http://download.microsoft.com/download/F/1/3/F1300C9C-A120-4341-90DF-8A52509B23AC/standalonesdk/sdksetup.exe'
$silentArgs = "/Quiet /NoRestart /Log $($env:temp)\windows-sdk-8.0.log"
$validExitCodes = @(0,3010)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes