$url = 'https://master.dl.sourceforge.net/project/openofficeorg.mirror/4.1.9/binaries/en-US/Apache_OpenOffice_4.1.9_Win_x86_install_en-US.exe'

$locales = @('ast', 'bg', 'ca', 'ca-XR', 'ca-XV', 'cs', 'da', 'de', 'el', 'en-GB', 'en-US', 'es', 'eu', 'fi', 'fr', 'gd', 'gl', 'he', 'hi', 'hu', 'it', 'ja', 'km', 'ko', 'lt', 'nb', 'nl', 'pl', 'pt', 'pt-BR', 'ru', 'sk', 'sl', 'sr', 'sv', 'ta', 'th', 'tr', 'vi', 'zh-CN', 'zh-TW')

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