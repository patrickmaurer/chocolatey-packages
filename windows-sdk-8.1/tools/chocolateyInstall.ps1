Install-ChocolateyPackage `
	'windows-8-1-sdk' 'exe' "/Quiet /NoRestart /Log $($env:temp)\windows-8-1-sdk.log" `
	'http://download.microsoft.com/download/B/0/C/B0C80BA3-8AD6-4958-810B-6882485230B5/standalonesdk/sdksetup.exe' -validExitCodes @(0,3010)