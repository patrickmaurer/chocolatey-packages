$packageName = 'pdf-ifilter-64'
$installerType = 'MSI'
$url = 'http://ardownload.adobe.com/pub/adobe/acrobat/win/11.x/PDFFilter64Setup.msi'
$checksum = 'BA08ED5D4B0A55B2E368BDF12E9EB67F9402CE8E82BEC09F3B2A03DAD7FF4316'
$checksumType = 'sha256'
$silentArgs = "/Quiet /NoRestart /Log $($env:temp)\pdf-ifilter-64.log"
$validExitCodes = @(0,3010)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -checksum "$checksum" -checksumType "$checksumType" -validExitCodes $validExitCodes