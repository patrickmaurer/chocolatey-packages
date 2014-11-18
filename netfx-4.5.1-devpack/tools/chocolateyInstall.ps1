Install-ChocolateyPackage `
	'netfx-4.5.1-devpack' 'exe' "/Quiet /NoRestart /Log $($env:temp)\netfx-4.5.1-devpack.log" `
	'http://download.microsoft.com/download/9/6/0/96075294-6820-4F01-924A-474E0023E407/NDP451-KB2861696-x86-x64-DevPack.exe' -validExitCodes @(0,3010)