$packageName = 'OpenOffice'
$installerType = 'EXE'
$url = 'https://downloads.sourceforge.net/project/openofficeorg.mirror/4.1.11/binaries/en-US/Apache_OpenOffice_4.1.11_Win_x86_install_en-US.exe'
$checksumType = 'sha256'
$silentArgs = '/S'
$validExitCodes = @(0,3010)

Write-Debug "Detecting Locale..."
$supportedLocales = @{
	'ast'   = '7df94300e844555969d8a0d1bb48ce36c5a54cd436be556ae9293b5a2adbb5c4';
	'bg'    = 'eb34b36673ef8303ab980e3de0e9dbabe5214f063d60f9feb92c5f59caa1a198';
	'ca'    = 'd986cc420c07612098afaa3eeab4e1f83901ecce45d83bb1a1bb77a3341331b3';
	'ca-XR' = 'a614703181ae699b198b2b5911f7f6c90bbed09170bdabd11a79627cbbf923b7';
	'ca-XV' = 'c0421192ef9671faf698e626fd23ca202546a1f746bbb2b49037b99c6016691b';
	'cs'    = 'e677e02a4df88dfbc7a7d4bfb382df906be818a8e0430b7b7257f69fc24885f6';
	'da'    = 'f2563f9d59680ee53f617581e14d4dfe6b123f5a1cffdd7e5b7baec3bfaa8dde';
	'de'    = '95372efdb627231848426237583dfbb70d00c689398a45d670e211f18ce08dd2';
	'el'    = '33e24c77e624d2b87d0b2ebd0eedfea5697328b445b7f7b3d90ccc7f2783f7e1';
	'en-GB' = 'ffc5ac41f6367739df05fb1fb46af6891b3aeb2ba87b1b234529a0d6c961595b';
	'en-US' = '9d4389c0a7d9fd13d0168f1f3faa6d67339162f7359694ff44ffb51bc303d11e';
	'es'    = 'ffd59f5b13f7cd586ba2b571078343441a61d77a4e80311dc2f6f75b28b92ba3';
	'eu'    = '460976fa8e32b2e9a062c4efa975ff9c7f8597fd3dc245e623893914dd340501';
	'fi'    = '77944639c2694a0fa097d930da0747c415c5edec694a0bc5fb7733ab326e9aac';
	'fr'    = '42489341b91f948787bcaf6b03f40049bb2356db5fff1cb65a7f8cfec6f3e275';
	'gd'    = '16624573c68bef5143ce2d4d33c5428db127e2bc43730f82b3d84a9ca7d09c6b';
	'gl'    = '5c22bee3adffa5ffb9ff9f68180a9a1700bee6b546052e19b826b32abf17b7b7';
	'he'    = 'f83fe4ab0acb6ee4afcd55bba62cf8431937f0bacc1647a71e35818eff93c116';
	'hi'    = 'e56fe1bd4119a3da906f156e66f9a0a803d6568fd798188f23ce7385f945c0ab';
	'hu'    = 'a18d68364f7b01e2bff0faadf986312910bc22bda9778f0780c39579e643e3da';
	'it'    = '4afda765588a1f5ff59c770af1c16313dcbe7cb40138271bb90c258d0fd7f119';
	'ja'    = 'a5d9b9c9e965ad414960d118e45eaa9189fb4d15ae7ab4a3f402dc7f24cff781';
	'km'    = '7122424d60d7766ea51deb8661323352bc1866b465d9b271f0bfbc1300bfb8ab';
	'ko'    = '5b31b89d40115a2225e3df93cca2581d5bcc7377b15a5ac16ff2d48926a7ee62';
	'lt'    = 'd229ff97c0dccb6a487577ac8bf3b80b5d06b0b6a12e5363115baa65d236a164';
	'nb'    = '1a8cfaac7991be4c649a4d9860652498d7f5f1222cf8ee604260d5f302673d46';
	'nl'    = 'ee2df8ff54a0bf2b422480f6d144112a3cc9f4e83a64c8f4194cf5b39039447b';
	'pl'    = 'fbe0e1892021cded8d5bd47f231f55aa6040fba690d62372a99a1d67f9271ff3';
	'pt'    = '92fef5ce91be9b46261dd8e78a7e647955c8bfbe2a6ec8e757528e28438894be';
	'pt-BR' = '068ef87c373ab96f728e2d92ae80ed93f6b550a70420f5d5e86991c3a0e09df5';
	'ru'    = '4dd84fecb2e13fe25d62305ffdd1248bd4a2b15765f9a093cab07640980f633b';
	'sk'    = '2e03882964f282db4a6dbeebbc8543c3a8dcc1bd19903d9cff6db081a6ec2997';
	'sl'    = 'ee8c9e6b6a4d8573f1b45b0764d12f7cec085adbde7806c31e94bd23ed4e928b';
	'sr'    = '3e02632809c0327d3806e62893add035bd6a62319b6ecec4acdad7f2a9aa2f19';
	'sv'    = '842377f6f7720c6ade0d285b9b4e5196d48c3441d4d0e8f624b5af5c499e12aa';
	'ta'    = '08370eb17178ecc6949279431f72248786cb7b7da45783697ab443f8865962ce';
	'th'    = 'c92f4e435ee5e87ed34850edaceabc2550176ef27bdf74cae18f79c492704448';
	'tr'    = '9400edb4990cbd9b6ec23ba1307e179fad6c7c9f66ad4bed0307e64f18728191';
	'vi'    = 'cae74918322e62b0c6036ab2595061dbfa1cb2c89f6cd54cb9f7a8d98c7fac88';
	'zh-CN' = '3074907712ebb62747cb43f5a320d97659c5553b49d1d78cdfbc19360c43ec0e';
	'zh-TW' = 'bce515b56820ee80a8c6a6ad6a70bd5e52bc086d61b0ade211cb5fd4b1f32999'
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