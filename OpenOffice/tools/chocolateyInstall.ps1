$packageName = 'OpenOffice'
$installerType = 'EXE'
$url = 'https://downloads.sourceforge.net/project/openofficeorg.mirror/4.1.15/binaries/en-US/Apache_OpenOffice_4.1.15_Win_x86_install_en-US.exe'
$checksumType = 'sha256'
$silentArgs = '/S'
$validExitCodes = @(0,3010)

Write-Debug "Detecting Locale..."
$supportedLocales = @{
	'ast'   = '3b677f16e818bab019c8902621487f44b2716fd7d624720ef8af34c6c2149732';
	'bg'    = '8a04dae6d11f1948d81092a706439d3e1906bd6b68df54ac4ad4962918e73d54';
	'ca'    = '65d9429dfdc42b61d3d10fcaf601414859547fc7848972ada35f3a261f876817';
	'ca-XR' = '394a2e4a6abe7832a57c418c86de1a86a48f0b10727e07a25af2b098ec97e0c0';
	'ca-XV' = '529694fb259518267ba0eb1f8cf7bb68210e05d684682be2e4cd27ef9d41e852';
	'cs'    = '782170f320b6f87f8af0431f2b52da516836da6832a2ff271957231dd5fa42c2';
	'da'    = '5d91a85c1888c607d6cee68d2b199a918ab863deb651d119f66d7680382827ed';
	'de'    = '81feb3d0b6968d8c1e34ac78d5a21c749f6356457755c445492cddf0da71d693';
	'el'    = 'df128454634b6fbc103c71bb839f52965f8db7c40276d9aa16398f37a13e4d16';
	'en-GB' = 'bc33bb6f0a47d26380976570537cc4d7f27cc7e1095686202627604db5e22842';
	'en-US' = '8352a06708b8ba439745ee86bf6a789e459cb3dd5d4832f752b696479b6fe289';
	'es'    = 'bbdf4c8d657e3123bd009ab086758bfd707f9b8c7f5fabb22783c4cb81784ca8';
	'eu'    = '0bf6cf17b4e8f1e89f52926f29339cf015951fba67a9bae5dc64ef6f9ca8e684';
	'fi'    = '40226f15398c4251d855030209e6839f9d2ff97f81b905dadd8c16fc891d7203';
	'fr'    = 'a6f33d935bd9c016b3d0914fd35d0985fbfb52018048a90e93f83984be09da9d';
	'gd'    = '01ea1c60f230bb49c7236d3f96c0183c35e5a2c721cd31231d96661eea541d4d';
	'gl'    = 'fb42fe7e677a11fb1a3ab340d25956f351af395b3c0391b41ec76c0f4660bad9';
	'he'    = '8fdccb66f93140a7fcc0f2ee5537d87aa5481a3cd39a12a98005759fd76035b1';
	'hi'    = '78914b3a4c3c8664472264574f766e37f317f57d9edcd1ac6949a2d1e8ee3f48';
	'hu'    = 'a7e7b2011fa40f011ed9ea7bf222a2999a9e8529b29f9f3b1c760f605a30ba61';
	'it'    = 'c112b2f07061632926d7d8f68614de49148fb529a668dc11909edde99bbc543d';
	'ja'    = 'a4d7a294ab3636439cc3d0f1147e6b9da8418f6a9054274ddc84b392ded85073';
	'km'    = '374b93b67863019ed34b415cbb77f02afd316a9be696bee6ac24155b2585ecf9';
	'ko'    = 'd192ca1607b22a0078387b59e14a64315f9ad6171007eaa15d2c7e54f8ec3799';
	'lt'    = '40d8e34b5a3e0f33e6afc6ad4635f94c9586c29ae1273d090686bb96b2669331';
	'nb'    = 'c106529038dc7688ea662b5b3aac79be1ac30bad5f984a46959cf21c503947a8';
	'nl'    = '0fee2961e57b3c76409bb005e03cb628f55e472223ff1e6ec037ab913548b5b0';
	'pl'    = '9bb2355c6e8c813be93a3fbc38b2ca79218095d48ccbfa4bcf55bd52260b3578';
	'pt'    = 'b3222991422a0a0074ace945e2975bf50f6b3a7bf3c387901a3fb97fdc89d05f';
	'pt-BR' = 'f5b4eff42ba8d7244c71764f6c84a44a03f7f47ee2cf325e00c93128762730f5';
	'ru'    = '480a3bfbc13bdc13da42e0b7d62ef616c6523e9fc3689b4f9e5a2026071fac5d';
	'sk'    = '3da5d936c08026d00d68a3a90eabc6431379df54f734cc716f7708b2e6285111';
	'sl'    = 'b3a45d318be5955cf6d5c88c8381bbcb2172a4a8f1476808745ddcc0c86debaf';
	'sr'    = '5decb195cf176375b844f80b7e7c89ec546828bb8440c91f199400203b799e7e';
	'sv'    = 'db58715d7da4ed1c79d96c275cf47e5bc7accaed47f9f5147c5fdb88bb17db23';
	'ta'    = '61bad21a7783b064795f213751cad7b2957017d8f310d4a7895b45278a5411e6';
	'th'    = 'bb9004173e99aa5f4fe988c583da15658c541edaa2785cf4a3485e4c4bcb65c9';
	'tr'    = '420cc37e88f1bc904f4252ef5b43675a828a7ed48ea219398d21485fc7e90367';
	'vi'    = '95317bd30299c6dd1f98897c37738f05f5c24faaee97e4c6dcfdf29b16a17277';
	'zh-CN' = '85d95ca4c989a34eba685a9d924cd10e647e40eeb7e28dda8b606722861a1f1a';
	'zh-TW' = '0328aac1d7bd8e2d610e40561bb22b8ee090a510e41969b162916a3914bf48f7';
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