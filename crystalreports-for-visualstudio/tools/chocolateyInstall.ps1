$packageName = 'crystalreports-for-visualstudio'
$installerType = 'MSI'
$url = 'https://downloads.businessobjects.com/akdlm/cr4vs2010/CRforVS_13_0_24.exe'
$checksum = '2244E354509A62B2404B98CBBFF68335083AA241851EC695C182E73E5B0DFCF1'
$silentArgsSDK = "/q /l ""$env:temp\$packageName-SDK.log"" UPGRADE=1"
$silentArgsRuntime = "/q /l ""$env:temp\$packageName-Runtime.log"" UPGRADE=1"

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Get-ChocolateyWebFile 'crystalreports-for-visualstudio' "$toolsDir\CRforVS_13_0_24.exe" "$url" -Checksum "$checksum" -ChecksumType 'sha256'
Get-ChocolateyUnzip "$toolsDir\CRforVS_13_0_24.exe" "$toolsDir\CRforVS_13_0_24"
Remove-Item "$toolsDir\CRforVS_13_0_24.exe"

$sdkFileFullPath = get-childitem $toolsDir -recurse -include CrystalReportsForVisualStudio.msi | select -First 1
Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgsSDK" "$sdkFileFullPath"

$is64bit = Get-ProcessorBits 64;
if ($is64bit) {
	$runtimeFileFullPath = get-childitem $toolsDir -recurse -include CRRuntime_64bit_13_0_24.msi | select -First 1
	Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgsRuntime" "$runtimeFileFullPath"
}

Remove-Item "$toolsDir\CRforVS_13_0_24" -recurse