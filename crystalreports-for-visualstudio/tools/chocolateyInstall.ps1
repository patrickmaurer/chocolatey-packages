try {
	$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
	Install-ChocolateyZipPackage 'crystalreports-for-visualstudio' 'http://downloads.businessobjects.com/akdlm/cr4vs2010/CRforVS_13_0_11.exe' "$toolsDir\CRforVS_13_0_11"

	$sdkFileFullPath = get-childitem $toolsDir -recurse -include CrystalReportsForVisualStudio.msi | select -First 1
	Install-ChocolateyInstallPackage 'crystalreports-for-visualstudio' 'MSI' "/q /l $($env:temp)\crystalreports-for-visualstudio-sdk.log UPGRADE=1" "$sdkFileFullPath"

	$is64bit = Get-ProcessorBits 64;
	if ($is64bit) {
		$runtimeFileFullPath = get-childitem $toolsDir -recurse -include CRRuntime_64bit_13_0_11.msi | select -First 1
		Install-ChocolateyInstallPackage 'crystalreports-for-visualstudio' 'MSI' "/q /l $($env:temp)\crystalreports-for-visualstudio-runtime-x64.log UPGRADE=1" "$runtimeFileFullPath"
	}
	
	Remove-Item "$toolsDir\CRforVS_13_0_11" -recurse

	Write-ChocolateySuccess 'crystalreports-for-visualstudio'
} catch {
	Write-ChocolateyFailure 'crystalreports-for-visualstudio' "$($_.Exception.Message)"
	throw
}