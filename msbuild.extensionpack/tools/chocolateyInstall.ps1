$packageName = 'msbuild.extensionpack'
$installerType = 'MSI'
$url = 'https://github.com/mikefourie/MSBuildExtensionPack/releases/download/Mar2015/MSBuild.Extension.Pack.March.2015.zip'
$silentArgs = '/Quiet'
$validExitCodes = @(0)
 
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" $toolsDir
Get-ChocolateyUnzip "$toolsDir\MSBuild.Extension.Pack.March.2015\MSBuild Extension Pack 4.0.11.0.zip" $toolsDir
 
$is64bit = Get-ProcessorBits 64;
$x86FileFullPath = Get-ChildItem $toolsDir -recurse -include *x86*.msi | select -First 1
$x64FileFullPath = Get-ChildItem $toolsDir -recurse -include *x64*.msi | select -First 1
 
Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" "$x86FileFullPath" -validExitCodes $validExitCodes
if ($is64bit) {
  Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" "$x64FileFullPath" -validExitCodes $validExitCodes
}
 
Remove-Item "$toolsDir\MSBuild.Extension.Pack.March.2015" -recurse
Remove-Item "$toolsDir\4.0.11.0" -recurse