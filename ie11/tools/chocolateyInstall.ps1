$packageName = 'ie11'
$installerType = 'EXE'
$32BitUrls = @{
	'en'='http://download.microsoft.com/download/9/2/F/92FC119C-3BCD-476C-B425-038A39625558/IE11-Windows6.1-x86-en-us.exe';
	'de'='http://download.microsoft.com/download/3/7/1/3712057D-154F-4F00-A183-0BD7285DF503/IE11-Windows6.1-x86-de-de.exe';
	'fr'='http://download.microsoft.com/download/2/B/8/2B8DB2FE-F707-486F-8726-D9FA6B62AB5F/IE11-Windows6.1-x86-fr-fr.exe';
	'es'='http://download.microsoft.com/download/7/4/3/7436E1CD-2F04-44A5-B1E8-73FDA58AE9CA/IE11-Windows6.1-x86-es-es.exe';
	'nl'='http://download.microsoft.com/download/8/1/0/810B26BA-0A1E-4F57-A324-3332FCD6963E/IE11-Windows6.1-x86-nl-nl.exe';
	'ja'='http://download.microsoft.com/download/D/5/3/D53EB67F-A614-4943-9162-E1479A6D6CB3/IE11-Windows6.1-x86-ja-jp.exe';
}
$64BitUrls = @{
	'en'='http://download.microsoft.com/download/7/1/7/7179A150-F2D2-4502-9D70-4B59EA148EAA/IE11-Windows6.1-x64-en-us.exe';
	'de'='http://download.microsoft.com/download/2/1/C/21C5BF29-634B-4D37-803D-AA565C267B15/IE11-Windows6.1-x64-de-de.exe';
	'fr'='http://download.microsoft.com/download/7/8/A/78A9ABC6-1102-40F4-891B-0A7E24920A25/IE11-Windows6.1-x64-fr-fr.exe';
	'es'='http://download.microsoft.com/download/6/8/4/68482751-6900-424D-801D-D9130D4FB9C9/IE11-Windows6.1-x64-es-es.exe';
	'nl'='http://download.microsoft.com/download/1/B/5/1B58F70F-23BA-4872-9AC0-20C7FFE28F13/IE11-Windows6.1-x64-nl-nl.exe';
	'ja'='http://download.microsoft.com/download/3/F/2/3F2D186B-826D-4F72-8386-91AFCCAED57F/IE11-Windows6.1-x64-ja-jp.exe';
}
$silentArgs = '/Passive /NoRestart'
$validExitCodes = @(0,3010,40013) #3010: reboot required, 40013: already installed

$ieKey = 'HKLM:\Software\Microsoft\Internet Explorer'
$majorVersion = -1
if (Get-ItemProperty -Path $ieKey -Name "SvcVersion" -ErrorAction SilentlyContinue) {
	$ieVersion = (Get-ItemProperty -Path $ieKey -Name "SvcVersion").svcVersion
	$majorVersion = [int]($ieVersion.Split('.')[0])
}

if ($majorVersion -lt 11) {
	Write-Debug "Detecting Locale..."
	$locale = (Get-Culture).TwoLetterISOLanguageName
	if ($32BitUrls.ContainsKey($locale)) {
		Write-Host "Switching to $locale"
	} else {
		$locale = 'en';
		Write-Debug "Using default $locale"
	}
	$32BitUrl = $32BitUrls.Get_Item($locale);
	$64BitUrl = $64BitUrls.Get_Item($locale);
	Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" "$64BitUrl" -validExitCodes $validExitCodes
	Write-Host 'You will likely need to restart your computer for the install to take effect.' -ForeGroundColor green
}
else {
	Write-Host "You currently have IE $majorVersion installed."
	Write-ChocolateySuccess 'ie11'
}