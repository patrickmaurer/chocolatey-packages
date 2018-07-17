$packageName = 'msbuild.extensionpack'
$installerType = 'MSI'
$url = 'https://github.com/mikefourie/MSBuildExtensionPack/releases/download/4.0.15.0/MSBuild.Extension.Pack.4.0.15.0.zip'
$checksum = 'BF94B89D9088D1F4DA9C36DCA223F803E65D3E58FB502A46E1D7E44F989D1D7D'
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

Remove-Item "$toolsDir\4.0.15.0" -recurse