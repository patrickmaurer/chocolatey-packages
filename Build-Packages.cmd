@echo off

pushd "%~dp0"

for /R %%F in (*.nuspec) do (
	echo Processing: %%~nxF
	pushd "%%~dpF"
	cpack.exe
	popd
)

popd

pause