Install-ChocolateyPackage `
	'netfx-4.0.2-devpack' 'exe' "/Quiet /NoRestart /Log $($env:temp)\netfx-4.0.2-devpack.log" `
	'http://download.microsoft.com/download/B/B/3/BB301D35-9D08-4012-B2F6-95823DFD3CEF/netfx_402mtpack.exe' -validExitCodes @(0,3010)