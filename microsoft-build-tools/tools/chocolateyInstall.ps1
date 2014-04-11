Install-ChocolateyPackage `
	'microsoft-build-tools' 'exe' "/Passive /NoRestart /Log $($env:temp)\microsoft-build-tools.log" `
	'http://download.microsoft.com/download/9/B/B/9BB1309E-1A8F-4A47-A6C5-ECF76672A3B3/BuildTools_Full.exe' -validExitCodes @(0,3010)