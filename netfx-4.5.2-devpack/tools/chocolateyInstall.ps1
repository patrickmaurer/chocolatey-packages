Install-ChocolateyPackage `
	'netfx-4.5.2-devpack' 'exe' "/Quiet /NoRestart /Log $($env:temp)\netfx-4.5.2-devpack.log" `
	'http://download.microsoft.com/download/4/3/B/43B61315-B2CE-4F5B-9E32-34CCA07B2F0E/NDP452-KB2901951-x86-x64-DevPack.exe' -validExitCodes @(0,3010)