#$url = 'https://downloads.sourceforge.net/project/openofficeorg.mirror/4.1.4/binaries/en-US/Apache_OpenOffice_4.1.4_Win_x86_install_en-US.exe'
$url = 'http://netix.dl.sourceforge.net/project/openofficeorg.mirror/4.1.4/binaries/en-US/Apache_OpenOffice_4.1.4_Win_x86_install_en-US.exe'

$locales = @('el', 'en-GB', 'en-US', 'es', 'eu', 'ca', 'ca-XR', 'ca-XV', 'cs', 'ru', 'zh-CN', 'zh-TW', 'vi', 'ta', 'th', 'tr', 'sk', 'sl', 'sr', 'sv', 'pl', 'pt', 'pt-BR', 'nb', 'nl', 'lt', 'km', 'ko', 'ja', 'it', 'he', 'hi', 'hu', 'gd', 'gl', 'fi', 'fr', 'da', 'de', 'bg', 'ast')

foreach ($locale in $locales) {
	$localeUrl = $url -replace 'en-US', $locale
	$outFile = "D:\Temp\OOO\$locale\setup.exe"
	
	echo "downloading: $localeUrl"
	echo "to file:     $outFile"

	New-Item -ItemType Directory -Force -Path "D:\Temp\OOO\$locale"
	
	Invoke-WebRequest -Uri $localeUrl -OutFile $outFile
	C:\ProgramData\chocolatey\lib\chocolatey\tools\chocolateyInstall\tools\checksum.exe "$outFile" --type sha256
}

pause