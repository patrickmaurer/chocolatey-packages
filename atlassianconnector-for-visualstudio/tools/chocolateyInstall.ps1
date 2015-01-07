$packageName = 'atlassianconnector-for-visualstudio'
$installerType = 'EXE'
$32BitUrl = 'http://update.atlassian.com/atlassian-vs-plugin/Downloads/atlassian-vs-connector-setup-1.3.11-STABLE-20130903-1404.exe'
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes