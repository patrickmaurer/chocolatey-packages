$packageName = 'atlassianconnector-for-visualstudio'
$installerType = 'EXE'
$32BitUrl = 'http://update.atlassian.com/atlassian-vs-plugin/Downloads/atlassian-vs-connector-setup-1.3.11-STABLE-20130903-1404.exe'
$silentArgs = '/S'
$validExitCodes = @(0)

try {
	$vs2008Installed = Test-Path 'HKLM:\SOFTWARE\Microsoft\VisualStudio\9.0'
	$vs2010Installed = Test-Path 'HKLM:\SOFTWARE\Microsoft\VisualStudio\10.0'
	$vs2012Installed = Test-Path 'HKLM:\SOFTWARE\Microsoft\VisualStudio\11.0'
	$vs2013Installed = Test-Path 'HKLM:\SOFTWARE\Microsoft\VisualStudio\12.0'
	if ($vs2008Installed -eq $false -and $vs2010Installed -eq $false -and $vs2012Installed -eq $false -and $vs2013Installed -eq $false) {
		throw 'Required version of Visual Studio is not installed (2008, 2010, 2012, or 2013).'
	}
} catch {
	Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
	throw
}

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes