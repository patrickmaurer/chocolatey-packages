﻿$packageName = 'OpenOffice'
$installerType = 'EXE'
$url = 'https://downloads.sourceforge.net/project/openofficeorg.mirror/4.1.4/binaries/en-US/Apache_OpenOffice_4.1.4_Win_x86_install_en-US.exe'
$checksumType = 'sha256'
$silentArgs = '/S'
$validExitCodes = @(0)

Write-Debug "Detecting Locale..."
$supportedLocales = @{
	'el'    = '724FB2ECA4F0EEB8F23F6588397463AFA36F7A74143D91EAB41ED1B0AA1A60F9';
	'en-GB' = '64AD68E835C284713E19CC5EABFA49D41CEE5046EE2CA9E124FFB6B9B2A4E11C';
	'en-US' = '1961802A59CACE2634C5DF71F13B3FFF744389E641B4CD6AC09ED92AC935082E';
	'es'    = '07761B98C90CB69F423EE9C7417ED26F7EA2CEAD4CEBEE02984F9B37BDB6952C';
	'eu'    = '351710208462E4FF76B073398B72771DA70C1AFA3CA80732A6077775FE925CDF';
	'ca'    = '972EBCE0096D086EE33D0191A3927A5A3F3D46740130AE6380465A5F9D77F4CC';
	'ca-XR' = 'C47138675E27C70057D906557A9633F356ABFB59728AE57949FC3E86E5A5632C';
	'ca-XV' = '089C3778034CB7C3A3D3634D43D0B4B53A041C21B914275200D5BFF16942059B';
	'cs'    = '81E29C460AA11CB621F10175ECC3A93C182AEC97624B72E8CE780D5FC062181F';
	'ru'    = 'A0749E476F7FCC683AF13B093784CF39F88D2DE12D7F55D7F3947409555D61F3';
	'zh-CN' = '7188FF7613656A88FB3074DAD3CA04B0052C45CF0EBF6B1EE5F48B633D1DC30B';
	'zh-TW' = '878E8267765C536BC0B859A18D91B99BA149C9D2D3AC9570026518AFD32BEF82';
	'vi'    = 'AEA6B431ADE54F886B14D9F47334D874A2965DB74EE7F3FE03B4A79EB2AB1E0F';
	'ta'    = '840300880E5232C8B88B86ABBCE015D9173111CE8E698505C00FB6313ED55F9B';
	'th'    = '0F5F5B6AFC264C0E609A7BF63D2E6AD8F33AB22B26388793841B85407127BF62';
	'tr'    = '3A83A43F0B69F3009715001586ABCE3EF8E05AD67571B398A6B290CE79B3731C';
	'sk'    = 'B92333C9E24489A6DBE18DE6C9C75A618BC17A963FF506F396EBF92B4F07555E';
	'sl'    = 'CACC78C97EB94F121E553A12733A403ACB1540CBBC6E83C9393E5D4ADA0AC54D';
	'sr'    = '927AE2BABAD34E91FB1526D48A3348C8BE774229BC117C2FFBC01AE0DD4A9D09';
	'sv'    = 'FE3122665696A7D95EA0DA749C9AA62ECB62392EF2690C5960798522DB7252FF';
	'pl'    = '079E125466C99EFC6C276D0D9B00EE18CB7278A0AAD164A2B552D941D319629D';
	'pt'    = '11430A45967C0C8D5B183CF5E3E0DFF3F1CB096DB8484492507DF6447B1F66B1';
	'pt-BR' = '10E5EB053AF4A8F8F27A808E08B8AB9903F6F9CB7598E1B25562899E00197FDD';
	'nb'    = '4C154A229BA3DCECFE1B3F6A76F697904594B76922C26A4037C70F4718744FDF';
	'nl'    = 'E7CCC5602CA17755CD76EEC3B0B4982D2D2833A98B65100A6A3BFEE9A52A337C';
	'lt'    = 'E3DBDACA0BD86C045A9D5325361E31C9DEC1FEA8F8326C2847A346F1B3BE5E1E';
	'km'    = 'E6E2ACF02A0120A9C75D773D27C6743B12BB885ECD2B5B6FD6517F59250D3CFA';
	'ko'    = '74BC03E37D7EDCF4C817E93DEFE0C4E1269B48A64B667911472D3F45DF21CAFF';
	'ja'    = '486239F9D88CA8429D031E2CB66CA07020DC28058DC9A72ADE8F6764B875D9EC';
	'it'    = '1B2C5F0789C9B5D430DFD1B17F7FC0A3F4BF2237300FBF4ED69CB21A46A3F25F';
	'he'    = '9972B61843CDBAB6A2009867D522AC4A650611F6954C29AF22E714EC65673CD0';
	'hi'    = '385BDB987DC0EF405264719D0527D279063E637A879FE2B6D83A83A8AB5E2E4C';
	'hu'    = 'CA673811853EDABC1CE8586A3E3C021D5D7EC65EA3059DCB1AD2413E5CEB2242';
	'gd'    = 'F1B26D84C2A6D1ED870A1B2B6FD2BD8C345515F94FD553164C53880D4AE89E16';
	'gl'    = 'ABE1EE5F5A42040DD669498F224AA4A608FBF67E7D35AB664C10C0B4A341F679';
	'fi'    = '2A5119BBBB473D2E92977E8A7211541001D2EC9E37DC21122E5FD955A29436C0';
	'fr'    = 'E3C45C88FD8B49D51CB50E8F5CF103D20B7E67369AB3A01E0ECE7B3694A9D325';
	'da'    = 'AF0C4B4134FB21781D1B81E0ACF264BD574B869C4CD6263CC741E9CAFE854F64';
	'de'    = '48545078494370D5DF9B55B97C310DE16154BE081A75A5E97F304AF068CCD58E';
	'bg'    = '1F0315985E8FF94E35CD06D91CE433B7DE394AAE53D819DD6BD5A9DB075A1B73';
	'ast'   = 'C579008E2DA5B8BD00DF1B5A8B1D1AE1B40818EC03FE594E744ECD463CC777F2'
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