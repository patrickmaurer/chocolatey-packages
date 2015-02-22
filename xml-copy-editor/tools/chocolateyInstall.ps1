$packageName = 'xml-copy-editor'
$installerType = 'EXE'
$32BitUrl = 'http://downloads.sourceforge.net/project/xml-copy-editor/xmlcopyeditor-windows/1.2.1.3/xmlcopyeditor-1.2.1.3-x86-install.exe'
$64BitUrl = 'http://downloads.sourceforge.net/project/xml-copy-editor/xmlcopyeditor-windows/1.2.1.3/xmlcopyeditor-1.2.1.3-x64-install.exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" "$64BitUrl" -validExitCodes $validExitCodes