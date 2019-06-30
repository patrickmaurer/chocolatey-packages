$packageName = 'crystalreports-for-visualstudio'
$installerType = 'MSI'
$url = 'https://origin.softwaredownloads.sap.com/public/file/0020000000898892019'
$checksum = 'EB42DC69E85AF8CF137E2B7A76E3F1F93463A6175B472B17DE3212251F731C89'
$silentArgsSDK = "/q /l ""$env:temp\$packageName-SDK.log"" UPGRADE=1"
$silentArgsRuntime = "/q /l ""$env:temp\$packageName-Runtime.log"" UPGRADE=1"

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Get-ChocolateyWebFile 'crystalreports-for-visualstudio' "$toolsDir\CRforVS_13_0_25.exe" "$url" -Checksum "$checksum" -ChecksumType 'sha256'
Get-ChocolateyUnzip "$toolsDir\CRforVS_13_0_25.exe" "$toolsDir\CRforVS_13_0_25"
Remove-Item "$toolsDir\CRforVS_13_0_25.exe"

$sdkFileFullPath = get-childitem $toolsDir -recurse -include CrystalReportsForVisualStudio.msi | select -First 1
Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgsSDK" "$sdkFileFullPath"

$is64bit = Get-ProcessorBits 64;
if ($is64bit) {
	$runtimeFileFullPath = get-childitem $toolsDir -recurse -include CRRuntime_64bit_13_0_25.msi | select -First 1
	Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgsRuntime" "$runtimeFileFullPath"
}

Remove-Item "$toolsDir\CRforVS_13_0_25" -recurse