$packageName = 'msbuild.extensionpack'
$installerType = 'MSI'
$url = 'https://github.com/mikefourie/MSBuildExtensionPack/releases/download/June2016/MSBuild.Extension.Pack.4.0.13.0.zip'
$checksum = '947B94AFE6DFF20934A42B0AB0F6844BC5AFD4A64761D3AE7BAD3F0A0C4D17A4'
$checksumType = 'sha256'
$silentArgs = '/Quiet'
$validExitCodes = @(0)

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" $toolsDir -checksum "$checksum" -checksumType "$checksumType" 

$is64bit = Get-ProcessorBits 64;
$x86FileFullPath = Get-ChildItem $toolsDir -recurse -include *x86*.msi | select -First 1
$x64FileFullPath = Get-ChildItem $toolsDir -recurse -include *x64*.msi | select -First 1

Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" "$x86FileFullPath" -validExitCodes $validExitCodes
if ($is64bit) {
  Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" "$x64FileFullPath" -validExitCodes $validExitCodes
}

Remove-Item "$toolsDir\4.0.13.0" -recurse