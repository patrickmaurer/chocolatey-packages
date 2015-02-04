$packageName = 'msbuild.extensionpack'
$installerType = 'MSI'
$url = 'https://github.com/mikefourie/MSBuildExtensionPack/releases/download/July2014/MSBuild.Extension.Pack.July.2014.zip'
$silentArgs = '/Quiet'
$validExitCodes = @(0)

try {
	$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
	Install-ChocolateyZipPackage "$packageName" "$url" $toolsDir
	Get-ChocolateyUnzip "$toolsDir\MSBuild.Extension.Pack.July.2014\MSBuild Extension Pack 4.0.10.0.zip" $toolsDir

	$is64bit = Get-ProcessorBits 64;
	$x86FileFullPath = Get-ChildItem $toolsDir -recurse -include *x86*.msi | select -First 1
	$x64FileFullPath = Get-ChildItem $toolsDir -recurse -include *x64*.msi | select -First 1

	Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" "$x86FileFullPath" -validExitCodes $validExitCodes
	if ($is64bit) {
		Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" "$x64FileFullPath" -validExitCodes $validExitCodes
	}

	Remove-Item "$toolsDir\MSBuild.Extension.Pack.July.2014" -recurse
	Remove-Item "$toolsDir\MSBuild Extension Pack 4.0.10.0" -recurse

	Write-ChocolateySuccess "$packageName"
} catch {
	Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
	throw
}