$packageName = 'microsoft-build-tools'
$installerType = 'EXE'
$url = 'http://download.microsoft.com/download/1/f/e/1fe5d584-c5a9-4aee-907a-421abe4c74f2/buildtools_full.exe'
$silentArgs = "/Passive /NoRestart /Log ""$($env:temp)\microsoft-build-tools-2015.log"""
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes