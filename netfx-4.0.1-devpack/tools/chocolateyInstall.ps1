$packageName = 'netfx-4.0.1-devpack'
$installerType = 'EXE'
$32BitUrl = 'http://download.microsoft.com/download/A/A/F/AAF243D8-C5C2-4632-AF96-CB65F378CE7D/VS10SP1-KB2495593.exe'
$silentArgs = "/Quiet /NoRestart /Log $($env:temp)\netfx-4.0.1-devpack.log"
$validExitCodes = @(0,3010)

#Installer aborts if VS2010 (full edition) is not installed even though it's not necessary. Add necessary values to bypass this check.
New-Item -Path 'HKLM:\SOFTWARE\Microsoft\DevDiv\VS\Servicing' -Name '10.0' –Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\DevDiv\VS\Servicing\10.0' -Name 'SP' -Value 1 -PropertyType 'DWord' -Force

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes