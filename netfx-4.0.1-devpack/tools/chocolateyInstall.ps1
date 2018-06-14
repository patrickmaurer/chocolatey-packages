$packageName = 'netfx-4.0.1-devpack'
$installerType = 'EXE'
$url = 'https://download.microsoft.com/download/A/A/F/AAF243D8-C5C2-4632-AF96-CB65F378CE7D/VS10SP1-KB2495593.exe'
$checksum = '39E1FFD6A4AF90670A5AF89CEFB9C7FA4325FBE7FFE8773FA9F7800B160E6D72'
$checksumType = 'sha256'
$silentArgs = "/Quiet /NoRestart /Log ""$($env:temp)\netfx-4.0.1-devpack.log"""
$validExitCodes = @(0,3010)

#Installer aborts if VS2010 (full edition) is not installed even though it's not necessary. Add necessary values to bypass this check.
$keyAlreadyExists = Test-Path 'HKLM:\SOFTWARE\Microsoft\DevDiv\VS\Servicing\10.0'
if ($keyAlreadyExists -eq $false) {
	Write-Debug 'Creating temporary key: "HKLM:\SOFTWARE\Microsoft\DevDiv\VS\Servicing\10.0"'
	New-Item -Path 'HKLM:\SOFTWARE\Microsoft\DevDiv\VS\Servicing' -Name '10.0' –Force
}

try {
	$key = Get-Item -Path 'HKLM:\SOFTWARE\Microsoft\DevDiv\VS\Servicing\10.0'
	$valueAlreadyExists = $key.GetValue('SP', $null) -ne $null

	if ($valueAlreadyExists -eq $false) {
		Write-Debug 'Creating temporary value: "HKLM:\SOFTWARE\Microsoft\DevDiv\VS\Servicing\10.0[@SP=1]"'
		New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\DevDiv\VS\Servicing\10.0' -Name 'SP' -Value 1 -PropertyType 'DWord' -Force
	}

	try {
		Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -checksum "$checksum" -checksumType "$checksumType" -validExitCodes $validExitCodes
	} finally {
		if ($valueAlreadyExists -eq $false) {
			Write-Debug 'Removing temporary value: "HKLM:\SOFTWARE\Microsoft\DevDiv\VS\Servicing\10.0[@SP=1]"'
			Remove-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\DevDiv\VS\Servicing\10.0' -Name 'SP' -Force
		}
	}
} finally {
	if ($keyAlreadyExists -eq $false) {
		Write-Debug 'Removing temporary key: "HKLM:\SOFTWARE\Microsoft\DevDiv\VS\Servicing\10.0"'
		Remove-Item -Path 'HKLM:\SOFTWARE\Microsoft\DevDiv\VS\Servicing\10.0' –Force
	}
}