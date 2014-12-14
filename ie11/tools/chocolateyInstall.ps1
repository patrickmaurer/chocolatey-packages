$packageName = 'ie11'
$installerType = 'EXE'
$32BitUrls = @{
	'en-US'='http://download.microsoft.com/download/9/2/F/92FC119C-3BCD-476C-B425-038A39625558/IE11-Windows6.1-x86-en-us.exe';
	'de-DE'='http://download.microsoft.com/download/3/7/1/3712057D-154F-4F00-A183-0BD7285DF503/IE11-Windows6.1-x86-de-de.exe';
	'fr-FR'='http://download.microsoft.com/download/2/B/8/2B8DB2FE-F707-486F-8726-D9FA6B62AB5F/IE11-Windows6.1-x86-fr-fr.exe';
	'es-ES'='http://download.microsoft.com/download/7/4/3/7436E1CD-2F04-44A5-B1E8-73FDA58AE9CA/IE11-Windows6.1-x86-es-es.exe';
	'nl-NL'='http://download.microsoft.com/download/8/1/0/810B26BA-0A1E-4F57-A324-3332FCD6963E/IE11-Windows6.1-x86-nl-nl.exe';
	'ja-JP'='http://download.microsoft.com/download/D/5/3/D53EB67F-A614-4943-9162-E1479A6D6CB3/IE11-Windows6.1-x86-ja-jp.exe';
}
$64BitUrls = @{
	'en-US'='http://download.microsoft.com/download/7/1/7/7179A150-F2D2-4502-9D70-4B59EA148EAA/IE11-Windows6.1-x64-en-us.exe';
	'de-DE'='http://download.microsoft.com/download/2/1/C/21C5BF29-634B-4D37-803D-AA565C267B15/IE11-Windows6.1-x64-de-de.exe';
	'fr-FR'='http://download.microsoft.com/download/7/8/A/78A9ABC6-1102-40F4-891B-0A7E24920A25/IE11-Windows6.1-x64-fr-fr.exe';
	'es-ES'='http://download.microsoft.com/download/6/8/4/68482751-6900-424D-801D-D9130D4FB9C9/IE11-Windows6.1-x64-es-es.exe';
	'nl-NL'='http://download.microsoft.com/download/1/B/5/1B58F70F-23BA-4872-9AC0-20C7FFE28F13/IE11-Windows6.1-x64-nl-nl.exe';
	'ja-JP'='http://download.microsoft.com/download/3/F/2/3F2D186B-826D-4F72-8386-91AFCCAED57F/IE11-Windows6.1-x64-ja-jp.exe';
}
$silentArgs = '/Passive /NoRestart'
$validExitCodes = @(0,3010,40013) #3010: reboot required, 40013: already installed
# LCID table: #http://msdn.microsoft.com/goglobal/bb964664.aspx
$mapping = @{
  1033='en-US'; # 1033 = English - United States
  2057='en-US'; # 2057 = English - United Kingdom
  3081='en-US'; # 3081 = English - Australia
  10249='en-US'; # 10249 = English - Belize
  4105='en-US'; # 4105 = English - Canada
  9225='en-US'; # 9225 = English - Caribbean
  15369='en-US'; # 15369 = English - Hong Kong SAR
  16393='en-US'; # 16393 = English - India
  14345='en-US'; # 14345 = English - Indonesia
  6153='en-US'; # 6153 = English - Ireland
  8201='en-US'; # 8201 = English - Jamaica
  17417='en-US'; # 17417 = English - Malaysia
  5129='en-US'; # 5129 = English - New Zealand
  13321='en-US'; # 13321 = English - Philippines
  18441='en-US'; # 18441 = English - Singapore
  7177='en-US'; # 7177 = English - South Africa
  11273='en-US'; # 11273 = English - Trinidad
  12297='en-US'; # 12297 = English - Zimbabwe
  1036='fr-FR'; # 1036 = French - France
  2060='fr-FR'; # 2060 = French - Belgium
  11276='fr-FR'; # 11276 = French - Cameroon
  3084='fr-FR'; # 3084 = French - Canada
  9228='fr-FR'; # 9228 = French - Democratic Rep. of Congo
  12300='fr-FR'; # 12300 = French - Cote d'Ivoire
  15372='fr-FR'; # 15372 = French - Haiti
  5132='fr-FR'; # 5132 = French - Luxembourg
  13324='fr-FR'; # 13324 = French - Mali
  6156='fr-FR'; # 6156 = French - Monaco
  14348='fr-FR'; # 14348 = French - Morocco
  58380='fr-FR'; # 58380 = French - North Africa
  8204='fr-FR'; # 8204 = French - Reunion
  10252='fr-FR'; # 10252 = French - Senegal
  4108='fr-FR'; # 4108 = French - Switzerland
  7180='fr-FR'; # 7180 = French - West Indies
  1122='fr-FR'; # 1122 = Frisian - Netherlands
  1127='fr-FR'; # 1127 = Fulfulde - Nigeria
  1071='fr-FR'; # 1071 = FYRO Macedonian
  1110='fr-FR'; # 1110 = Galician
  1079='fr-FR'; # 1079 = Georgian
  1031='de-DE'; # 1031 = German - Germany
  3079='de-DE'; # 3079 = German - Austria
  5127='de-DE'; # 5127 = German - Liechtenstein
  4103='de-DE'; # 4103 = German - Luxembourg
  2055='de-DE'; # 2055 = German - Switzerland
  1041='ja-JP'; # 1041 = Japanese
  3082='es-ES'; # 3082 = Spanish - Spain (Modern Sort)
  1034='es-ES'; # 1034 = Spanish - Spain (Traditional Sort)
  11274='es-ES'; # 11274 = Spanish - Argentina
  16394='es-ES'; # 16394 = Spanish - Bolivia
  13322='es-ES'; # 13322 = Spanish - Chile
  9226='es-ES'; # 9226 = Spanish - Colombia
  5130='es-ES'; # 5130 = Spanish - Costa Rica
  7178='es-ES'; # 7178 = Spanish - Dominican Republic
  12298='es-ES'; # 12298 = Spanish - Ecuador
  17418='es-ES'; # 17418 = Spanish - El Salvador
  4106='es-ES'; # 4106 = Spanish - Guatemala
  18442='es-ES'; # 18442 = Spanish - Honduras
  22538='es-ES'; # 22538 = Spanish - Latin America
  2058='es-ES'; # 2058 = Spanish - Mexico
  19466='es-ES'; # 19466 = Spanish - Nicaragua
  6154='es-ES'; # 6154 = Spanish - Panama
  15370='es-ES'; # 15370 = Spanish - Paraguay
  10250='es-ES'; # 10250 = Spanish - Peru
  20490='es-ES'; # 20490 = Spanish - Puerto Rico
  21514='es-ES'; # 21514 = Spanish - United States
  14346='es-ES'; # 14346 = Spanish - Uruguay
  8202='es-ES'; # 8202 = Spanish - Venezuela
}

$ieKey = 'HKLM:\Software\Microsoft\Internet Explorer'
$majorVersion = -1
if (Get-ItemProperty -Path $ieKey -Name "SvcVersion" -ErrorAction SilentlyContinue) {
	$ieVersion = (Get-ItemProperty -Path $ieKey -Name "SvcVersion").svcVersion
	$majorVersion = [int]($ieVersion.Split('.')[0])
}

if ($majorVersion -lt 11) {
	Write-Debug "Detecting Locale..."
	$LCID = (Get-Culture).LCID
	if ($mapping.ContainsKey($LCID)) {
		$locale = $mapping.Get_Item($LCID);
		Write-Host "Switching to $locale"
	} else {
		$locale = 'en-US';
		Write-Debug "Using default $locale"
	}
	$32BitUrl = $32BitUrls.Get_Item($locale);
	$64BitUrl = $64BitUrls.Get_Item($locale);
	Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" "$64BitUrl" -validExitCodes $validExitCodes
	Write-Host 'You will likely need to restart your computer for the IE 11 install to take effect.' -ForeGroundColor green
}
else {
	Write-Host "You currently have IE $majorVersion installed."
	Write-ChocolateySuccess 'ie11'
}