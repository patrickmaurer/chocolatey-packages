$packageName = 'xml-copy-editor'
$installerType = 'EXE'
$32BitUrl = 'http://downloads.sourceforge.net/project/xml-copy-editor/xmlcopyeditor-windows/1.3.0.0/xmlcopyeditor-1.3.0.0-x86-install.exe'
$64BitUrl = 'http://downloads.sourceforge.net/project/xml-copy-editor/xmlcopyeditor-windows/1.3.0.0/xmlcopyeditor-1.3.0.0-x64-install.exe'
$checksum = '427A8C9CB7D0C399B2C5E992610CCA4F9557E09E8BFA57FEB8D24468610CDC6D'
$checksum64 = 'F7D329942B28A30A55CB90DF17EB2149F827075ED682EFEF593730A8C231AD19'
$checksumType = 'sha256'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP'
$validExitCodes = @(0)

$packageArgs = @{
  packageName   = $packageName
  fileType      = $installerType
  url           = $32BitUrl
  url64bit      = $64BitUrl
  silentArgs    = $silentArgs
  validExitCodes= $validExitCodes
  checksum      = $checksum
  checksumType  = $checksumType
  checksum64    = $checksum64
  checksumType64= $checksumType
}

Install-ChocolateyPackage @packageArgs