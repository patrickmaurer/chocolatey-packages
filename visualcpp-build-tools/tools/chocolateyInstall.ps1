$packageName = 'visualcpp-build-tools'
$installerType = 'EXE'
$url = 'https://download.microsoft.com/download/5/A/8/5A8B8314-CA70-4225-9AF0-9E957C9771F7/vs_BuildTools.exe'
$checksum = 'E77D433C44F3D0CBF7A3EFA497101DE93918C492C2EBCAEC79A1FAF593D419BC'
$checksumType = 'sha256'
$silentArgs = "--quiet --norestart --add Microsoft.VisualStudio.Workload.VCTools"
$validExitCodes = @(0,3010)

$pp = Get-PackageParameters

if ($pp["IncludeRequired"] -ne $null -and $pp["IncludeRequired"] -ne '') { $pp["IncludeRequired"] = 'true' }
if ($pp["IncludeRecommended"] -ne $null -and $pp["IncludeRecommended"] -ne '') { $pp["IncludeRecommended"] = 'true' }
if ($pp["IncludeOptional"] -ne $null -and $pp["IncludeOptional"] -ne '') { $pp["IncludeOptional"] = 'true' }
if ($pp["IncludeRequired"] -eq $null -and $pp["IncludeRecommended"] -eq $null -and $pp["IncludeOptional"] -eq $null) { $pp["IncludeRecommended"] = 'true' }

if ($pp["IncludeOptional"] -eq 'true') {
	$silentArgs += ' --includeOptional'
}
else if ($pp["IncludeOptional"] -eq 'true') {
	$silentArgs += ' --includeRecommended'
}
else {
	// required components are installed if no additional parameters given
}

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -checksum "$checksum" -checksumType "$checksumType" -validExitCodes $validExitCodes