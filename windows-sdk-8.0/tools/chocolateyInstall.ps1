Install-ChocolateyPackage `
	'windows-sdk-8.0' 'exe' "/Quiet /NoRestart /Log $($env:temp)\windows-sdk-8.0.log" `
	'http://download.microsoft.com/download/F/1/3/F1300C9C-A120-4341-90DF-8A52509B23AC/standalonesdk/sdksetup.exe' -validExitCodes @(0,3010)