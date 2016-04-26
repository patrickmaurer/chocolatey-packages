$packageName = 'VisualStudio2015TestProfessional'
$installerType = 'EXE'
$url = 'http://download.microsoft.com/download/6/2/6/626E579E-C602-4C50-8CDC-8A0D9E2A658B/testprofessional_ENU.exe'
$silentArgs = "/Passive /NoRestart /Log ""$env:temp\$packageName.log"""
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes