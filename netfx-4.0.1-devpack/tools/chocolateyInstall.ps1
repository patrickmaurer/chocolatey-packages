Install-ChocolateyPackage `
	'netfx-4.0.1-devpack' 'exe' "/Quiet /NoRestart /Log $($env:temp)\netfx-4.0.1-devpack.log" `
	'http://download.microsoft.com/download/A/A/F/AAF243D8-C5C2-4632-AF96-CB65F378CE7D/VS10SP1-KB2495593.exe' -validExitCodes @(0,3010)