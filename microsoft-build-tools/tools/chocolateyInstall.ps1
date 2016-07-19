$packageName = 'microsoft-build-tools'
$installerType = 'EXE'
$url = 'http://download.microsoft.com/download/4/3/3/4330912d-79ae-4037-8a55-7a8fc6b5eb68/buildtools_full.exe'
$silentArgs = "/Passive /NoRestart /Log ""$($env:temp)\microsoft-build-tools-2015.log"""
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes