$packageName = 'VS2010.1'
$installerType = 'EXE'
$32BitUrl = 'http://download.microsoft.com/download/2/3/0/230C4F4A-2D3C-4D3B-B991-2A9133904E35/VS10sp1-KB983509.exe'
$silentArgs = "/q /REBOOT=ReallySuppress"
$validExitCodes = @(0,3010)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes