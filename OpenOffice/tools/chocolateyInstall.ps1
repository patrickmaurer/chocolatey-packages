$packageName = 'OpenOffice'
$installerType = 'EXE'
$url = 'https://downloads.sourceforge.net/project/openofficeorg.mirror/4.1.6/binaries/en-US/Apache_OpenOffice_4.1.6_Win_x86_install_en-US.exe'
$checksumType = 'sha256'
$silentArgs = '/S'
$validExitCodes = @(0)

Write-Debug "Detecting Locale..."
$supportedLocales = @{
	'ast'   = '433c02f31a55c5aeed436c9d3883390b75b51ea452b9db7df3fc47e2f23fab72';
	'bg'    = 'a185383914fa18fdf373298bbc8a0072a3acda9bbc26a845e877cdf384b7e2e3';
	'ca'    = '0f8ae3a0fd4b06b62455683b59b027e070bef27e12193dd3acb25bb3cf67c2c0';
	'ca-XR' = 'be0a4b6eb44aafe3d513dea974ff9726fa6ea4f1e9e79559ab3b295c4f376ce1';
	'ca-XV' = '976072b6df50f26346a802327c2b8fb542df112a2afc5b63ee17177c32ebba7e';
	'cs'    = 'db60e58ca6e505c0772b08fc6b4dadbd3466944a9b298e4510426500f0eca91a';
	'da'    = '4e8983258e8f82b8704bc3115352cd231912deca0ed7aa2dffadb96c045cfab2';
	'de'    = '7b26aed8de0ce5729fda29e27754e25a6e1dc8c16b415a7094d16fcdd8a51094';
	'el'    = 'ab02e5b10d311052c0b68507815cc6f28ac6810a9ef28711197374a8b4c50749';
	'en-GB' = 'c2db89f490bed788c2010bf29f90b39b4b86e61524b3a6ecedb0b54df113d4c7';
	'en-US' = 'e1af0f097f24dac6fbfb7af2558d4d6fafa994158f1a592b485a0ddc7e6c1f47';
	'es'    = 'a096d775f8b080c1b745853c62917eb9df52b0c818b44d6ef2faaafb4588ccb6';
	'eu'    = '7ad8b0b8cc269775373834d88f4f06552eb2128d4be2e951597d050971df7008';
	'fi'    = '213ace1e2ccaf93451e17c4430654aa156597512255ce33321eb7b718054a0e7';
	'fr'    = '636a7a03b49d57239b829c5aa86b0eca2828eaed1b79b45dc4dc2cd78a05864c';
	'gd'    = '10358c9a600af09109d72d1a541d397f9308a08b643d82ed36966ee3eede39ff';
	'gl'    = '2a25bc5ac43727a6a3479666b9a6ed93da1a9e07c56f68905c098ab59bf436a0';
	'he'    = '80992ce3a11bbcbcaca2ce506d472ec4b0c0a4a73d5a4e6860557d54c168b818';
	'hi'    = '72de7206cad67dfae71d9f2d8e1f184c442b0b7ada23dcc11556e9e5f4205a87';
	'hu'    = '898db06df9ee41f63f533a67b217b6853e5e53bfd218a945849f204a3f92615b';
	'it'    = 'b8cc785afcb6fd353d1ab8bc8c3da6128ffeb3ad71a2ae14a8cc5448f7e6e62c';
	'ja'    = '3a7f8b11e4ace31e1ea7b678a9d248253e5a98dc245906bba940509756367764';
	'km'    = 'fc922e1fcbda42753228c6ead88dee7d638cc3f7afe5d02c64eca53d24b71d34';
	'ko'    = '2326627aae4e73d83ec93bb20e5406adef3c8fa33a16fd34cabf094bb5d8ee9b';
	'lt'    = '284c2a29d449b13fbe5fb9e355b0ddc76ad41e1e647aaf0fff039d16d87ec7f9';
	'nb'    = '41da1dd6b0237e9eb4e327bcdf7c9b0602472ce8f2441b4cb1b1297ea935d16d';
	'nl'    = '9b4f4393e4e4f5efaa81f127b5ba9ddc6277142d33c6331085d2dd33ea18243f';
	'pl'    = 'f5e4548583b8de73c87fe29e8434c8e89a0a35ea3d3c37bfe799f0afd869bf35';
	'pt'    = 'd4dded88feb9ddc1a26ce307a0bbb35c3281b330d8d471f1445c1a12a6e9c5cb';
	'pt-BR' = '7b7ff7a4c2a21069ce0d70179d33d75d772adf0a019a687b11231198aa18acb6';
	'ru'    = 'fa28127697a63f4c1ffd22c199323642c23c4dccfcefaaf7554c3378260534d6';
	'sk'    = 'f8ebe4796a266a7434a02b2a5c3ceca98369c964f35953e2b36063bc43d2fcf2';
	'sl'    = '451ddf93835b94d2f51dccde7edc8ec47ea78c8497a125431e77fbe1ea83f31b';
	'sr'    = '536d0922f67089c95059cc4b9830fc8c47776b1ced3ed3f1ac50157f5f3c6e77';
	'sv'    = '6f7e1bc2590152139e4f4044ff7d9a28355712396d18e4a1b56f179fcc507bc2';
	'ta'    = 'c78405f29f5552e3e588cc757d81cc562c19d45ef4311048217371153e9f993c';
	'th'    = '38effaae82bbfe1b2ff3977d5f27ccdd7fd59e1631a168d65d27860191116d5d';
	'tr'    = '0cf742a366161cf9f10ee249651ff48913899d66aa58815f0f1271c6dcb8076e';
	'vi'    = '9773a13e9dc4d01564278a87cb0cdf2dda87dc572bfedc12781b3cae242b1bbf';
	'zh-CN' = '412a36e8a755b9e8c8b4f43dcfd711c13f3ea51d866377cf47350f36e4285304';
	'zh-TW' = '217ffb98b64195bdff3dafc66c3ddd8d3e35126e904b0047523c5ec50c6d721e'
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