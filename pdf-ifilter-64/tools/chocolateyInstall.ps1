$packageName = 'pdf-ifilter-64'
$installerType = 'MSI'
$32BitUrl = 'http://ardownload.adobe.com/pub/adobe/acrobat/win/11.x/PDFFilter64Setup.msi'
$silentArgs = "/Quiet /NoRestart /Log $($env:temp)\pdf-ifilter-64.log"
$validExitCodes = @(0,3010)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$32BitUrl" -validExitCodes $validExitCodes