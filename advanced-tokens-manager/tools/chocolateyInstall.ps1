try {
	$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
	
	$wc = New-Object System.Net.WebClient
	$wc.Proxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials
	$wc.Headers.Add('Referer', 'http://joshcellsoftwares.com/download/?appID=ATM')
	$wc.DownloadFile('http://joshcellsoftwares.com/core/download.php?appID=ATM', "$toolsDir\Advanced Tokens Manager v3.5 RC 5.zip")
	Get-ChocolateyUnzip "$toolsDir\Advanced Tokens Manager v3.5 RC 5.zip" $toolsDir
	Remove-Item "$toolsDir\Advanced Tokens Manager v3.5 RC 5.zip"
	Move-Item "$toolsDir\Advanced Tokens Manager v3.5 RC 5\*" $toolsDir
	Remove-Item "$toolsDir\Advanced Tokens Manager v3.5 RC 5" -recurse

	$shortcutDir = "$($env:ProgramData)\Microsoft\Windows\Start Menu"
	if (Test-Path $shortcutDir)
	{
		$wshShell = New-Object -ComObject WScript.Shell
		$link = $wshShell.CreateShortcut("$shortcutDir\Advanced Tokens Manager.lnk")
		$link.TargetPath = "$toolsDir\Advanced Tokens Manager.exe"
		$link.WorkingDirectory = $toolsDir
		$link.Save()
	}

	Write-ChocolateySuccess 'advanced-tokens-manager'
} catch {
	Write-ChocolateyFailure 'advanced-tokens-manager' "$($_.Exception.Message)"
	throw
}