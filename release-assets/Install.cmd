@echo off
setlocal
set "VSIX=%~dp0HNB-SqlAssist-Lite.vsix"
set "IDE=C:\Program Files\Microsoft SQL Server Management Studio 22\Release\Common7\IDE"
if not exist "%IDE%\VSIXInstaller.exe" set "IDE=C:\Program Files\Microsoft SQL Server Management Studio 21\Release\Common7\IDE"

if not exist "%IDE%\VSIXInstaller.exe" (
    echo SSMS 21 or 22 was not found in the default location.
    pause
    exit /b 1
)
if not exist "%VSIX%" (
    echo HNB-SqlAssist-Lite.vsix must be in the same folder as this file.
    pause
    exit /b 1
)

echo Closing SSMS...
taskkill /im Ssms.exe /f >nul 2>&1

echo Installing HNB-SqlAssist-Lite...
"%IDE%\VSIXInstaller.exe" "%VSIX%"
endlocal
