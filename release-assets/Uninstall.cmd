@echo off
setlocal
set "IDE=C:\Program Files\Microsoft SQL Server Management Studio 22\Release\Common7\IDE"
if not exist "%IDE%\VSIXInstaller.exe" set "IDE=C:\Program Files\Microsoft SQL Server Management Studio 21\Release\Common7\IDE"

if not exist "%IDE%\VSIXInstaller.exe" (
    echo SSMS 21 or 22 was not found in the default location.
    pause
    exit /b 1
)

echo Closing SSMS...
taskkill /im Ssms.exe /f >nul 2>&1

echo Uninstalling HNB-SqlAssist-Lite...
"%IDE%\VSIXInstaller.exe" /uninstall:SqlAssistLite.31f1541f-73c8-46e1-b0eb-204cdd50bed5
endlocal
