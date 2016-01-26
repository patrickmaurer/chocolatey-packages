$packageName = 'OpenOffice'
$installerType = 'EXE'
$32BitUrl = 'http://downloads.sourceforge.net/project/openofficeorg.mirror/4.1.2/binaries/en-US/Apache_OpenOffice_4.1.2_Win_x86_install_en-US.exe'
$silentArgs = '/S'
$validExitCodes = @(0)

Write-Debug "Detecting Locale..."
$supportedLocales = @('el', 'en-GB', 'en-US', 'es', 'eu', 'ca', 'ca-XR', 'ca-XV', 'cs', 'ru', 'zh-CN', 'zh-TW', 'vi', 'ta', 'th', 'tr', 'sk', 'sl', 'sr', 'sv', 'pl', 'pt', 'pt-BR', 'nb', 'nl', 'lt', 'km', 'ko', 'ja', 'it', 'he', 'hi', 'hu', 'gd', 'gl', 'fi', 'fr', 'da', 'de', 'bg', 'ast')
$locale = (Get-Culture).Name
if ($supportedLocales -contains $locale) {
	Write-Host "Switching to $locale"
	$32BitUrl = $32BitUrl -replace 'en-US', $locale
} else {
	$locale = (Get-Culture).TwoLetterISOLanguageName
	if ($supportedLocales -contains $locale) {
		Write-Host "Switching to $locale"
		$32BitUrl = $32BitUrl -replace 'en-US', $locale
	} else {
		Write-Debug "Using default $locale"
	}
}

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes