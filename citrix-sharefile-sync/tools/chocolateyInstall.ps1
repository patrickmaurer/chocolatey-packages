$packageName = 'citrix-sharefile-sync'
$installerType = 'MSI'
$url = 'https://www.citrix.com/downloads/sharefile/clients-and-plug-ins/sharefile-sync-for-windows-32.html'
$silentArgs = '/quiet'
$validExitCodes = @(0)

try {
	Write-Debug "Downloading main download page from '$url'"
	$wc = New-Object System.Net.WebClient
	$wc.Proxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials
	$mainPage = $wc.DownloadString($url)

	if ($mainPage -match '"(//downloads.citrix.com/7110/ShareFileSync32_3.2.109.0.msi\?.*?)"') {
		$32BitUrl = 'https:' + $Matches[1]
		Write-Debug "32 bit download URL is '$32BitUrl'"
	}

	if ($mainPage -match '"(//downloads.citrix.com/7110/ShareFileSync64_3.2.109.0.msi\?.*?)"') {
		$64BitUrl = 'https:' + $Matches[1]
		Write-Debug "64 bit download URL is '$64BitUrl'"
	}

	Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" "$64BitUrl" -validExitCodes $validExitCodes
} catch {
	Write-ChocolateyFailure "$packageName" $($_.Exception.Message)
	throw
}