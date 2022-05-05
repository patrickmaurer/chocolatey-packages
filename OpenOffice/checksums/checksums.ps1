$url = 'https://downloads.apache.org/openoffice/4.1.12/binaries/en-US/Apache_OpenOffice_4.1.12_Win_x86_install_en-US.exe.sha256'

$locales = @('ast', 'bg', 'ca', 'ca-XR', 'ca-XV', 'cs', 'da', 'de', 'el', 'en-GB', 'en-US', 'es', 'eu', 'fi', 'fr', 'gd', 'gl', 'he', 'hi', 'hu', 'it', 'ja', 'km', 'ko', 'lt', 'nb', 'nl', 'pl', 'pt', 'pt-BR', 'ru', 'sk', 'sl', 'sr', 'sv', 'ta', 'th', 'tr', 'vi', 'zh-CN', 'zh-TW')

foreach ($locale in $locales) {
	$localeUrl = $url -replace 'en-US', $locale

	$webClient = New-Object System.Net.WebClient
	$content = $webClient.DownloadString($localeUrl)

	$sha256 = $content.substring(0, $content.indexOf(' '))

	$padding = "";
	if ($locale.length -eq 3) {
		$padding = "  "
	}
	if ($locale.length -eq 2) {
		$padding = "   "
	}

	echo "	'${locale}' ${padding}= '${sha256}';"
}

pause