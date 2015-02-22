$packageName = 'echotool'
$url = 'http://bansky.net/echotool/echotool.exe'
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$targetPath = Join-Path $toolsDir 'echotool.exe'

Get-ChocolateyWebFile $packageName $targetPath $url