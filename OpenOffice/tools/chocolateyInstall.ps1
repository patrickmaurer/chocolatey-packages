$packageName = 'OpenOffice'
$installerType = 'EXE'
$url = 'https://downloads.sourceforge.net/project/openofficeorg.mirror/4.1.13/binaries/en-US/Apache_OpenOffice_4.1.13_Win_x86_install_en-US.exe'
$checksumType = 'sha256'
$silentArgs = '/S'
$validExitCodes = @(0,3010)

Write-Debug "Detecting Locale..."
$supportedLocales = @{
	'ast'   = '58bec9f828396f909ac4da1331facad4ecb71300ee5d955b9acfea85a2320620';
	'bg'    = '0e90e1f1cb9a99d0e4f20d880982ce498fb534857d94d52a29984d7deafee443';
	'ca'    = 'e8190fbfa2c1555c8b9004360725a14a53f9a832511957c6ce233097dd41c711';
	'ca-XR' = '22a8a23163df07ab778086d90fea99d08dfbb812948ad4285010e8d2dee22966';
	'ca-XV' = '8935a3b2518c776cc1f621efde21fd5b442fbea0b198d6a870b5a7db1f2fb1f9';
	'cs'    = '43b8521398529c9cfe7bd80eb6a24fdbfdf0e8bcee37a9eba4398299a3344203';
	'da'    = '2dfc14e670ed52e16a5f43cc7f2b0ab31f2c4a1434201949b02be27e1dc09453';
	'de'    = '86651bccefe120b84da8fb0d0dcd694a22b632f82531c38e7141bc5675c821e5';
	'el'    = '172d923f83c4dfd13418ab31d8b789208553c4b5f0b7bdc94e32e100936acd35';
	'en-GB' = '36735d5aa9750ee1b2d57bdd25eafcdd7ab420a5d0569710f0398fe76d6ebf7b';
	'en-US' = '0e393b90e58c3e3870f7a1571f98294204a04db1d23d009a5980e5be6bcdcece';
	'es'    = '813d81ed71be50496fcf3fa21409bab06ad586950f5ac47530045bed5f94883d';
	'eu'    = '8daf8973d3b9cd4fec5b06cde894589f892b0d346edb8c1e70e10d2d10810475';
	'fi'    = '2e72737babe7034462987dd01774339da6c6ae45fd0bfe74e0e877a8aca78871';
	'fr'    = '013cd3a9de2c65e45d9d179878988bc03c53086a4633f1af2d050f50af93af7c';
	'gd'    = '9a384409c7e24d8560d3099d8346be9a28637a76e5233adc7e5a5a3a9c534ebd';
	'gl'    = '32df1678e767cf86b723609f1bd34373cfb7d570a68e79e8337d7fb259821e08';
	'he'    = '0176a375aec494c7edee716efdae89fa5e2f392d5466c3c4f70843ce456785ba';
	'hi'    = '7aaf57bdc1d236296af147f60b2fd92841b464967c6262bb1f4c7923b20ca78e';
	'hu'    = '045d65e26fd7bba5c332051d1be6cac94cec6f09c58d48806f3ea17873603d28';
	'it'    = '3f09207162108dd71c40f586389b2c1c55e038ff05320c55c6efc31adabe10cd';
	'ja'    = '761d83f12778908b86ab9d3f4c7b670e6b6c78fc361dbffae20590d1ad0f009a';
	'km'    = '6bd6b75d80f3c42139406fc6dce3adf3ba7b49027ed0109c00be9eea16106e19';
	'ko'    = '016c2d115530588c6eacd4e3fb6721ce2b977198ed095773e232f13f0c9059fa';
	'lt'    = 'a77f999354a656cd6152b3b762dda2e0daa3cbd1d251bc10f7ce05117abad8c0';
	'nb'    = '0c8fd5dcecc29a45720d935851c80ebf95644c135953719258b7ddd66ec927e9';
	'nl'    = '04bc7a15c53661f135481d2f0387c119b553dceb089a33dbf15d5e29a6328c2d';
	'pl'    = '02e94cd4f9923dae2d7ca725f6722ef162403c360366d273ac3a89b69913959e';
	'pt'    = '285ce553261851ed4f334cd1b559ff9562bfacbe2cd1f122aa17c680bedb1e40';
	'pt-BR' = '0a2585f73128acf1e90cbc91d1e71ce675ce9b3f987a6ce87a95e715b1751c0c';
	'ru'    = '3c0a0830dcad4b4de3cf8a7d23c7b395634eb60d4f6cff2f1d935df617c608ef';
	'sk'    = '8f70b487318f96aad0fb9ac3226a1c59324ad2aec9ae9dd4f1f1aff281a7418b';
	'sl'    = '60d742bba6a8582dcb088eb52c2c99ad147971689d843b121ece2df6b8562e30';
	'sr'    = '3920ce21ff5738fb572b28b40cf471de9fd393cc1513495421aba77d68364f5c';
	'sv'    = '8e7e0a8e8e8cb70572b6f20a1e08c665861d1c74a1ae832f8d42ca8ce0012c57';
	'ta'    = 'b722da32d3d08f35b21b4ed7f5e46930507f7bb5c2fc215aa9b71693bd0c07a3';
	'th'    = '1d4476bf97282759ba3f5862b254d4bc2939b40023b11799d867f8a1813990f8';
	'tr'    = '93d1950c6a5b09953e90d290a058a18d365cdb77bdb6f1297f629ba4fe23fb1f';
	'vi'    = '91af3c5f52a1d2cc5987196c44f981fa9249f34d0b8442f5dd5dfb99bcef8b9f';
	'zh-CN' = '62f9d23b8b0cd575c0ecd30380a64bb8d3de50bdc378c63f9530e27a52a1422c';
	'zh-TW' = '589dcb5c0a07d0e868bfcefafc81c3a01e41a925fee99356e1ef9586b89be221'
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