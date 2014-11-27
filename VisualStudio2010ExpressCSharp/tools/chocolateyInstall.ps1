$packageName = 'VisualStudio2010ExpressCSharp'
$installerType = 'EXE'
$32BitUrl = 'http://download.microsoft.com/download/4/9/3/493D82B1-363D-4954-A87D-C4B7C5A1C895/vcs_web.exe'
$silentArgs = "/q /REBOOT=ReallySuppress"
$validExitCodes = @(0,3010)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes