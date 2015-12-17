$packageName = 'windows-sdk-10.1'
$installerType = 'EXE'
$url = 'https://download.microsoft.com/download/6/A/2/6A2ECE81-C934-4E47-91CC-52DA00A65345/sdksetup.exe'
$silentArgs = "/Quiet /NoRestart /Log ""$env:temp\$packageName.log"""
$validExitCodes = @(0,3010)
Install-ChocolateyPackage $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes