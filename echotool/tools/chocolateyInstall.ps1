$packageName = 'echotool'
$url = 'https://github.com/pbansky/EchoTool/releases/download/v1.5.0.0/echotool.exe'
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$targetPath = Join-Path $toolsDir 'echotool.exe'

Get-ChocolateyWebFile $packageName $targetPath $url