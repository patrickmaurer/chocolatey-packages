$packageName = 'microsoft-build-tools'
$installerType = 'EXE'
$url = 'http://download.microsoft.com/download/E/E/D/EEDF18A8-4AED-4CE0-BEBE-70A83094FC5A/BuildTools_Full.exe'
$silentArgs = "/Passive /NoRestart /Log $($env:temp)\microsoft-build-tools-2015.log"
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes