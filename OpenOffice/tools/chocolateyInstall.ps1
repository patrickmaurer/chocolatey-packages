$packageName = 'OpenOffice'
$installerType = 'EXE'
$url = 'https://downloads.sourceforge.net/project/openofficeorg.mirror/4.1.12/binaries/en-US/Apache_OpenOffice_4.1.12_Win_x86_install_en-US.exe'
$checksumType = 'sha256'
$silentArgs = '/S'
$validExitCodes = @(0,3010)

Write-Debug "Detecting Locale..."
$supportedLocales = @{
	'ast'   = 'd0272ee3ecfe76aa5438fd59d5d103150b2c16cf979c0c23b29b1d6b4f765f94';
	'bg'    = '76d3ca3019b2deac3f79ee013dd91404e1671f5e278f4fc34e2a6d3436a0ee2c';
	'ca'    = '927f93bb2476c6313fd22bb86d92db73acd540b10ba9354caaf3b7dbf851b3ed';
	'ca-XR' = 'a8830baee530005acd44d7e9b47e4b634e6b1eec2d7240a348ce0a2832d28de6';
	'ca-XV' = '955c2c30330664163e3e809dba241e422a7ea6c333136d5c8d5f3f965d361fb5';
	'cs'    = '3c68cda51df6b2104652689a960497a1795aae3cfdcc0d08a67b09c395d1bf61';
	'da'    = '13730afb25af5083975f075c6ebc4d2115e0917aaa0b4b04415eca2b53f87e68';
	'de'    = '372a495def3d0e323d9181b9a1f49a421ada5446400a4a522fc4d1fc3c29d7a2';
	'el'    = '150bdaeac7c7fd7becdc0773ab82bfb1ee673f00814c614d88c5a453971ec8c7';
	'en-GB' = 'a65ee3804c0ab88b02de2219185c408c32e3ff143828d4affb543a8bcc3c5f43';
	'en-US' = 'c7a9e3fb3d7b9a56a741534179fcf7f1f412fe1a399356e155e704600aaf6809';
	'es'    = '5e20be1d3b4a9bf62928e60e77e94435906eedb7a785e70ddaa7910df8726af0';
	'eu'    = '5e2c23353e81ec986fe267fe75f90eca4038f8a6f3434488ca34ed9564ae2dd0';
	'fi'    = '603800aa3ea9b689b2fc863beda31f43a6e3fc68f2e85b40bc5f41628067a23d';
	'fr'    = 'ae6c7758072363f725ef5d4bcd7da20d8e9b8fcd58685665ae6688553ece9ed1';
	'gd'    = 'd5c0a3eb7e90860a2fc2fd9639d15251a8ba49e7d992044fa1c603d08bd2d8e1';
	'gl'    = '8d7fe63dff7fd53c51bf724da8d86f6a438b259123587613f90ca7e064e28b9b';
	'he'    = '242061ee3c0c0c8371fff011555119049df0cb061a3dc15f8fbee8bc5a6ab81d';
	'hi'    = '5c99240066dd3651337398986b1dbee1dfb155a5aa89b69aaff46485f8e53681';
	'hu'    = '05bb2f4878fac0b2e7dafce9d19c84010986465fa45d4a8177a8854bba38af47';
	'it'    = '16abeeec57f6bd8893f42cd47ee0dcef74cbc444820e2d795138bde6d2ba55cd';
	'ja'    = '2cd225207b1e5d0c07440fe5978c14c3025a8f7eaad2e6441dc2293e97db3b40';
	'km'    = 'e4c0e5dc4a4281271d0b551e63918ff3482fac6f505222ea7e336af87841fc03';
	'ko'    = '7d1cfca25e30f6ea70d29a419b85ffed7ba0d9ce6b0f8a15b15e934fd1ce82e6';
	'lt'    = 'd010343373ffa800117a80cbeea6901c184b680c6f2d15d33c85a5bd94982e0c';
	'nb'    = '3ab5210e399ac66bfbb9d7c1229439d4d6080c93b7befa3854b8bbccca51ef71';
	'nl'    = 'f73a160854adf054f11ba9fa0f7ad913d9290dfee4f38bd168e1c299833e436b';
	'pl'    = '946f196ad87552f45855fe19249073e3bef3d3b63306ca2968ccbed62b431342';
	'pt'    = 'e62cd62dd2f28dce7a23e7c9779061fe9b4acdd4622a5473ea0d7dcb99a4b9e5';
	'pt-BR' = '81ace53ffe48b67270e38fd8785b8f1f11b3263816cddb28d977b9a6aee1f05c';
	'ru'    = 'cf3e77819c9a06ca5e4303c960596c84f195088bcf803ea931a7797a09929f5c';
	'sk'    = '6b83fe8ec2fbfe545114aef35131004eb10d951debeda27029afcdb91892ac4a';
	'sl'    = 'c3a97699b853d3ab7cde5ee1f041989e3d1ef3f10ba9084c8f5f7bcb06167564';
	'sr'    = 'a9e04c3cded6c8fe1b77c917bcd4c3b81caf398a6c59f98e547fb3ce19bdf4b0';
	'sv'    = '4dc89598e5267797303a71fb7d2c950e881ae7326c04f4417d72f90e59ffaad6';
	'ta'    = '8ea4eacabcf359045eaea5dc31d6d8cb75841a4c5e47a8455da238b6190f37e4';
	'th'    = 'c8df58bf5eb891788055afd37004fb1d5d5f9c90468a60ec5d3947548c19bb1e';
	'tr'    = '8a99100e15cf705198a5f8da8d3f6603c1c7747b257ae3f04d0efa64733fd72a';
	'vi'    = '0c298079660c922f60e6b12115e1785efc0f32be8e733d6a7668233abd1e32a5';
	'zh-CN' = '041071b05d84750ce3492b6536923491d2fdde3a34fcd8424c828d5e50c0b739';
	'zh-TW' = 'c08b402145130b679b49b3c90bb63f3574404557f4b9603af7c064e668e97a13'
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