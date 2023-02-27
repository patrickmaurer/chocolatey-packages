$packageName = 'OpenOffice'
$installerType = 'EXE'
$url = 'https://downloads.sourceforge.net/project/openofficeorg.mirror/4.1.14/binaries/en-US/Apache_OpenOffice_4.1.14_Win_x86_install_en-US.exe'
$checksumType = 'sha256'
$silentArgs = '/S'
$validExitCodes = @(0,3010)

Write-Debug "Detecting Locale..."
$supportedLocales = @{
	'ast'   = '3e717397aed84233225220095c5e9dcca85a9f7b6c55ac221d719cb8f5690e92';
	'bg'    = '552d058bc4e429edfe5b5253a1d727c9364b3dc94fa64f5a0ca6978db499566e';
	'ca'    = 'b5e8242569f49f524f7fece8c05bee8e8aac3024285313e9b9a74c5516e2b322';
	'ca-XR' = '44e4ec3918ce37f0ccca0d6cd522d26441f60b2387ff1975170d3b9471d86fff';
	'ca-XV' = 'cb6b984a025fe622ca8d0a59243f24295d885295084946f22ed0b9d7a2438cc5';
	'cs'    = '14d8ae90f975c89f435177f7d01de73448d62c0b9667dd6c1a9b22114181495a';
	'da'    = '7c46bde47a638f6a2bf36eb094acaab0150b559810fbe3a7c3183d4bb00ef642';
	'de'    = '5b83bfead59051fb1d173df4f77024479f443e13167efd642b534a383115ccda';
	'el'    = '0c3f2bb7b261f2fc22521f9a8be4be08f1fe6a8bda19e120ba9725525350b762';
	'en-GB' = '2930ec6dd02aaceeb637fe85b19ef4146d7d0fd39cfde81fb05fd57a4ce13a03';
	'en-US' = '2df5dcf77ffbacff12cb39d004ac3bce5643595ff8a9e5e45828bbc7c942969f';
	'es'    = 'b04b8d34bdfc50a0ef0c0a59529a5907f1d49f1a97ec959f21937d5ce04259c5';
	'eu'    = 'a0a1945def5cbe7d390e0bf1adc697177fe37785bdd4582f6f90c9e0a1aac91f';
	'fi'    = 'fa8d1c59102a0612c87236d959a6fb810b7156f4b9e2b0e738744cdd4f566e6e';
	'fr'    = '5d92a1efe837226376c3bd6c4ad0ec58ed2455da8001d8e25c96ca82ea7d1119';
	'gd'    = 'cf9addbc42c8c55430db45330bc974766e2242ee33fb7f6e045427c7f3556cb6';
	'gl'    = '847329cb63654b9512687f2394016eb9447b09b53a7f697b55a404f3561a4736';
	'he'    = '19c59be23d72c2f7589d2caafa5c12d0d152312a7ccf2bfa13caf2c810395267';
	'hi'    = '60004a6605fbd1144eb3aa335243f44276d8de51658f7c7d10cd8732a5c0105e';
	'hu'    = '635beadbcb655a015b929e02d9d31e084304138370f5bfb2e28dc79ce406a926';
	'it'    = '5ae4cd25ea1cfc188a3c746748dd36c210d5f11fd10bb67d7e2472c630065bcf';
	'ja'    = '45108d200aa806b1fe1c93b510417e8b9df51d6aa3e72f46cbd7eacd616b3f9b';
	'km'    = '392772e2b6e25193e8a366a7cdabd878b2c1e5334a6159bdd189b174ce9bae62';
	'ko'    = '10144f3b1cb2bcd0140739e3f50d14b676e6867f7413c59066bcbbd1d3fd6699';
	'lt'    = '82700c1eff9ac5d4e6d237b029e95823a50e692870a46032971a6d5976f5e14f';
	'nb'    = 'd59330a3783ba939c671a24fd8aa9ae92c13eef365366a92c57e206d0ae5dc93';
	'nl'    = 'fd33924adb02315630dfd8ed4bf10740136cf0a5a15cd05a2d9eb87c37d284e2';
	'pl'    = 'a86ca69938b1d49806575ab95313b010c8362c4305629dee902240be5ae9a9c7';
	'pt'    = 'c3dcf3712b3cc5fbe750078b90826d81f75f3c015ef5c66d86795772de221b84';
	'pt-BR' = '9f712fde441c2f37b3ab8a4258fa09485dbc7b5e776615c416fbf06786b60c9b';
	'ru'    = '21627f53f8d9a53a008ad7229566e8040472ecd004383b898a35fef50de9ceec';
	'sk'    = 'd72ee964014d5f320eeabb2d0f1adfeb2e89abf880d26207c08b8647896016ac';
	'sl'    = 'f800c7dce087bc20ad8d31b67d7f8f17bdc04904790190e155fba50b460ec178';
	'sr'    = 'e485267b94c25176692fb8e99f3340d68d45283492f3bb664eece8c91d92bdf2';
	'sv'    = '635ef4c4d531690ac17b44712c605958467675a482d856966a2864166697a271';
	'ta'    = 'f64aa173c453d9507d1d18de9477d3153090afb7f08c1999d100f13bb5a2cd5a';
	'th'    = 'f66779363d06ae44aabdfffa429fec71092e6a0fcc5747be4ec57d2c56db9943';
	'tr'    = '6e324a4a3f3f6a5c82d1824a51b07a0b3ea9fe382dae45e8bbdcd4c1c1fee3af';
	'vi'    = '9fdb94426671e0ae123317ae12f80a419c630f375be4ae2a293278a2f80a359b';
	'zh-CN' = '007631495ad9662b1acfa689aee5549bbf7c0ac8b454e92dcfdf2671fa098a52';
	'zh-TW' = 'e1ac25ec748172027958e8f6075bd30e8d0524783733f14404813bc8e8f82402';
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