$packageName = 'office2010starter'
$installerType = 'EXE'
$32BitUrl = 'http://files01.techspot.com/temp/setupconsumerc2rolw.exe'
$silentArgs = ''
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes