$packageName = 'crystalreports-for-visualstudio'
$installerType = 'MSI'
$url = 'https://downloads.businessobjects.com/akdlm/cr4vs2010/CRforVS_13_0_17.exe'
$checksum = '9751AF7B96B7ADD76E044DDD561266C886425D957EEC38D4B65A37F877868830'
$silentArgsSDK = "/q /l ""$env:temp\$packageName-SDK.log"" UPGRADE=1"
$silentArgsRuntime = "/q /l ""$env:temp\$packageName-Runtime.log"" UPGRADE=1"

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Get-ChocolateyWebFile 'crystalreports-for-visualstudio' "$toolsDir\CRforVS_13_0_17.exe" "$url" -Checksum "$checksum" -ChecksumType 'sha256'
Get-ChocolateyUnzip "$toolsDir\CRforVS_13_0_17.exe" "$toolsDir\CRforVS_13_0_17"
Remove-Item "$toolsDir\CRforVS_13_0_17.exe"

$sdkFileFullPath = get-childitem $toolsDir -recurse -include CrystalReportsForVisualStudio.msi | select -First 1
Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgsSDK" "$sdkFileFullPath"

$is64bit = Get-ProcessorBits 64;
if ($is64bit) {
	$runtimeFileFullPath = get-childitem $toolsDir -recurse -include CRRuntime_64bit_13_0_17.msi | select -First 1
	Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgsRuntime" "$runtimeFileFullPath"
}

Remove-Item "$toolsDir\CRforVS_13_0_17" -recurse