$packageName = 'OpenOffice'
$installerType = 'EXE'
$url = 'https://downloads.sourceforge.net/project/openofficeorg.mirror/4.1.10/binaries/en-US/Apache_OpenOffice_4.1.10_Win_x86_install_en-US.exe'
$checksumType = 'sha256'
$silentArgs = '/S'
$validExitCodes = @(0)

Write-Debug "Detecting Locale..."
$supportedLocales = @{
	'ast'   = '40ec03c33081f3d63de09e86aca7efcc606e72358517153359c2eec5fdf05c6a';
	'bg'    = '05a87cec627f074b6653404ad6e0ce7908a226e85927c3438c070ffb62b605b8';
	'ca'    = 'eea22aba9efc9f6b34d450dbe83545bf2da992e89fbf26f04cdc2fb8707ee08b';
	'ca-XR' = 'd4e697ec97748f8945be77b3e4b33b9c909ef4f41f7c48532fb645a34cf26451';
	'ca-XV' = 'ca4191f34a55ab425c2606ffdfb663b810a703bda672191d888677dc4684daf5';
	'cs'    = 'a7d5e27f6c57d82d306fc898b82f7fe7722e2403d07d7f5f78fb50b5cb6fe8a0';
	'da'    = 'adc3f26bd704e789a866cbb52dcf16fc545725ef42d2f981e705cbf379953abb';
	'de'    = '148a6c9b500d97d0363f9ae5c33347f945b809eb9ecdae0935a16ea2306ae129';
	'el'    = '0cacdac9a921a9d355dfb7460a0719fe28ba40f2f40c0c9549c8c63c416d5b58';
	'en-GB' = '894f1bfa8402de7e43991bde91d48ac9420059b98f7f005325bf3540e644e2aa';
	'en-US' = 'b02a429e6bca3deb0023f6dd91055a8b1df1a75b54063a86c5c6345bd47fbd13';
	'es'    = '7a32697359b92cf2cd11974c96d133df6cc4bbcc671d7b0177bc417ceaa903b7';
	'eu'    = '89610362f213102b509416d731edbcf208cd43984cbe3480672231808903d445';
	'fi'    = '08b7a789bc35d998cce1bbdb8f8a840a4f1fa78c3feadfedeefb0702321feda8';
	'fr'    = '4ed67cd927c5f4001966257a9a90d253d18bd94647282f9ab7afbaca014a943a';
	'gd'    = 'd80b0bf77a08119f551d83771cdcd3b8f1dd7b7f23208aae901ff7e127431ebd';
	'gl'    = 'e6046e76d24b116c504b6fc29887a363ced3e68d23cdb2562aafb87a992773de';
	'he'    = '031a95a19445fce41218037be64f3f1d41e61e65ef0bfd58a25678cbd9f50e14';
	'hi'    = '6e22b062e384413d979cc7374677ba65c80732b44f02ef91137cef0939df3e43';
	'hu'    = '66694f9fea1fb4cca4fa7cb3e2e2fe56c2a46cde70bb6d753685ad49425eeb22';
	'it'    = 'c1a07eb0d00b150aecbd40da9a771a2100e45c8e690b875ed2fbeedab0313d4e';
	'ja'    = '70497b907f841235c141ffaacb3073ffd12bcd4a919f7bb2f1ec676d795bc406';
	'km'    = '7bec8041c7d2e1348fcc0b326378066783c9570dfa6640e02cce3c25993faf6d';
	'ko'    = 'dd53e892539e14e34edca8b6790d93272480216e9b1e66b9609165b00b53a677';
	'lt'    = 'ba2489e286995df7366b54925a4f6a131d7369b55499956a7ccd8d0fbd3b31ab';
	'nb'    = '9c32488dbea0a0e0f04f97ab6b636b80b567abb1e624f80865634679d5776cba';
	'nl'    = 'bb58c88e4a2dbd6ea8d4ab8b7bde08d77e5c500da8b1cec8e5b9ada251cdb1a5';
	'pl'    = '5d9926d101b61c34b11f97999598fa2505d309a62839ab7d2fc758380fce8be3';
	'pt'    = 'f5267d4cd700a71872a840313f90e1d6bfd8b9221e552b7f26cd1d99f4fabfb8';
	'pt-BR' = 'cd4b205b0420b32ddd9cd9700a9d1529af9a32ea111a1835ab2816d8a5374277';
	'ru'    = '86ec252e340bc95d7a7516873ebd0f0da7f2738f5d35bd0a1f9140cc74ad6691';
	'sk'    = '0fb51b919c5b9ad5560d9ab1daa6d023aee6c6bded15113be8069cfba5d58545';
	'sl'    = '142f258ed8dfae93fda6ea2d80463240690f9d3cff70e5aa193a6f0f8d053ef9';
	'sr'    = '7d334f1ca72377ae10ab4dbdf43519d60ef44be052a5b91a9b1f6bb7d1e28c5c';
	'sv'    = '3464116f594007f9317fc06f88ad062b143818d560952dc97eef5f51e4accc64';
	'ta'    = 'cc96172f6b3af63fa5d58ca2b95e9391503fee27e56f4e11eb1d994a8e9f7aab';
	'th'    = 'e67dd2e83e6626b53fe3410292e70621a11b112afe3558f26b474a185d6ae269';
	'tr'    = '1dac425fecee4f4fcbe4da0a590f2557e2fcde286a9315e83205a43a354136cf';
	'vi'    = '96b5194ba489fbb2450286827e7c305c6d34d84394b3ea3ddf58153f0f0ea7a1';
	'zh-CN' = '3d5a2e4f682aa84018c6a838c1ceea372820328df75dadbe414868aa4a05c673';
	'zh-TW' = '39e9e9cbb2014aeaa4442b2df070fd06a7eeadbe427bc6da9e257bcf428440b3'
}

$pp = Get-PackageParameters
$locale = $pp["locale"]
if ($locale -ne $null -and $locale -ne '' -and $supportedLocales.ContainsKey($locale)) {
	Write-Host "Switching to $locale"
	$url = $url -replace 'en-US', $locale
	$checksum = $supportedLocales[$locale]
} else {
	$locale = (Get-Culture).Name
	if ($supportedLocales.ContainsKey($locale)) {
		Write-Host "Switching to $locale"
		$url = $url -replace 'en-US', $locale
		$checksum = $supportedLocales[$locale]
	} else {
		$locale = (Get-Culture).TwoLetterISOLanguageName
		if ($supportedLocales.ContainsKey($locale)) {
			Write-Host "Switching to $locale"
			$url = $url -replace 'en-US', $locale
			$checksum = $supportedLocales[$locale]
		} else {
			Write-Debug "Using default $locale"
			$checksum = $supportedLocales['en-US']
		}
	}
}

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -checksumType $checksumType -checksum $checksum -validExitCodes $validExitCodes