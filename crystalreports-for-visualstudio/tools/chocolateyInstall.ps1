$packageName = 'crystalreports-for-visualstudio'
$installerType = 'MSI'
$url = 'http://downloads.businessobjects.com/akdlm/cr4vs2010/CRforVS_13_0_16.exe'
$silentArgsSDK = "/q /l ""$env:temp\$packageName-SDK.log"" UPGRADE=1"
$silentArgsRuntime = "/q /l ""$env:temp\$packageName-Runtime.log"" UPGRADE=1"

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Get-ChocolateyWebFile 'crystalreports-for-visualstudio' "$toolsDir\CRforVS_13_0_16.exe" "$url"
Get-ChocolateyUnzip "$toolsDir\CRforVS_13_0_16.exe" "$toolsDir\CRforVS_13_0_16"
Remove-Item "$toolsDir\CRforVS_13_0_16.exe"

$sdkFileFullPath = get-childitem $toolsDir -recurse -include CrystalReportsForVisualStudio.msi | select -First 1
Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgsSDK" "$sdkFileFullPath"

$is64bit = Get-ProcessorBits 64;
if ($is64bit) {
	$runtimeFileFullPath = get-childitem $toolsDir -recurse -include CRRuntime_64bit_13_0_16.msi | select -First 1
	Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgsRuntime" "$runtimeFileFullPath"
}

Remove-Item "$toolsDir\CRforVS_13_0_16" -recurse