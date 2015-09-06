$packageName = 'windows-sdk-10.0'
$installerType = 'EXE'
$url = 'http://download.microsoft.com/download/E/1/F/E1F1E61E-F3C6-4420-A916-FB7C47FBC89E/standalonesdk/sdksetup.exe'
$silentArgs = "/Quiet /NoRestart /Log ""$env:temp\$packageName.log"""
$validExitCodes = @(0,3010)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes