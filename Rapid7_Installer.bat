@echo off
setlocal EnableDelayedExpansion
title Rapid7 Insight Agent Installer

:: =====================================================
:: CONFIGURATION - UPDATE ONLY THESE VALUES
:: =====================================================

:: Rapid7 Deployment Token
set "R7_TOKEN=TOKEN_ID"

:: Network Share
set "URL_X64=\\PC_NAME\R7\agentInstaller-x86_64.msi"
set "URL_ARM64=\\PC_NAME\R7\agentInstaller-arm64.msi"

:: =====================================================
:: DO NOT MODIFY BELOW THIS LINE
:: =====================================================

:: Working Folder
set "WORKDIR=%TEMP%\Rapid7"

if not exist "%WORKDIR%" mkdir "%WORKDIR%"

set "LOG_FILE=%WORKDIR%\Rapid7Install.log"

echo =====================================================
echo          Rapid7 Insight Agent Installer
echo =====================================================
echo.

:: -----------------------------------------------------
:: Detect Architecture
:: -----------------------------------------------------

echo Detecting system architecture...

if /I "%PROCESSOR_ARCHITEW6432%"=="ARM64" (
    set "ARCH=ARM64"
) else if /I "%PROCESSOR_ARCHITEW6432%"=="AMD64" (
    set "ARCH=x64"
) else if /I "%PROCESSOR_ARCHITECTURE%"=="ARM64" (
    set "ARCH=ARM64"
) else (
    set "ARCH=x64"
)

if /I "%ARCH%"=="ARM64" (
    set "DOWNLOAD_URL=%URL_ARM64%"
    set "MSI_NAME=agentInstaller-arm64.msi"
) else (
    set "DOWNLOAD_URL=%URL_X64%"
    set "MSI_NAME=agentInstaller-x86_64.msi"
)

echo Architecture : %ARCH%
echo Installer    : %MSI_NAME%
echo.

:: -----------------------------------------------------
:: Verify Network Share
:: -----------------------------------------------------

echo [1/3] Checking network share...
echo.

if not exist "%DOWNLOAD_URL%" (
    echo [FAILED] Unable to access the installer.
    echo.
    echo Network Path:
    echo %DOWNLOAD_URL%
    echo.
    echo Please verify:
    echo   - PC_NAME is powered on.
    echo   - The R7 folder is shared.
    echo   - You have read permission.
    echo.
    pause
    exit /b 1
)

echo [OK] Installer found.
echo.

:: -----------------------------------------------------
:: Install
:: -----------------------------------------------------

echo [2/3] Installing Rapid7 Insight Agent...
echo Please wait...
echo.

msiexec /i "%DOWNLOAD_URL%" ^
CUSTOMTOKEN=%R7_TOKEN% ^
/l*v "%LOG_FILE%" ^
/qn

if %ERRORLEVEL% EQU 0 (
    echo [OK] Installation completed successfully.
) else if %ERRORLEVEL% EQU 3010 (
    echo [OK] Installation completed successfully.
    echo A system reboot is required.
) else (
    echo.
    echo [FAILED] Installation failed.
    echo Exit Code : %ERRORLEVEL%
    echo.
    echo Review the installation log:
    echo %LOG_FILE%
    echo.
    pause
    exit /b %ERRORLEVEL%
)

echo.

:: -----------------------------------------------------
:: Finished
:: -----------------------------------------------------

echo [3/3] Rapid7 Insight Agent installation completed.
echo.
echo Installation Log:
echo %LOG_FILE%
echo.
echo Press any key to exit...
pause >nul
