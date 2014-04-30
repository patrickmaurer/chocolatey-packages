try {
	$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
	Install-ChocolateyZipPackage 'msbuild.extensionpack' 'https://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=msbuildextensionpack&DownloadId=808874&FileTime=130381716453930000&Build=20885' $toolsDir

	$is64bit = Get-ProcessorBits 64;
	$x86FileFullPath = Get-ChildItem $toolsDir -recurse -include *x86*.msi | select -First 1
	$x64FileFullPath = Get-ChildItem $toolsDir -recurse -include *x64*.msi | select -First 1

	Install-ChocolateyInstallPackage 'msbuild.extensionpack' 'MSI' '/Quiet' "$x86FileFullPath"
	if ($is64bit) {
		Install-ChocolateyInstallPackage 'msbuild.extensionpack' 'MSI' '/Quiet' "$x64FileFullPath"
	}

	Remove-Item "$toolsDir\4.0.9.0" -recurse

	Write-ChocolateySuccess 'msbuild.extensionpack'
} catch {
	Write-ChocolateyFailure 'msbuild.extensionpack' "$($_.Exception.Message)"
	throw
}