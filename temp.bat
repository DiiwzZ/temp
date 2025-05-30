@echo off
title The Cleaner
chcp 65001 >nul
color 0A
cls

REM Set console mode for proper ASCII display
mode con cols=150 lines=50
REM Set font to a more compatible one for box drawing characters
REG ADD HKEY_CURRENT_USER\Console\%~n0 /v FaceName /t REG_SZ /d "Lucida Console" /f >nul
REG ADD HKEY_CURRENT_USER\Console\%~n0 /v FontSize /t REG_DWORD /d 0x000c0000 /f >nul
REG ADD HKEY_CURRENT_USER\Console\%~n0 /v FontFamily /t REG_DWORD /d 0x00000036 /f >nul
REG ADD HKEY_CURRENT_USER\Console\%~n0 /v FontWeight /t REG_DWORD /d 0x00000190 /f >nul

REM ตั้งค่า TrueType Font เป็นค่าเริ่มต้น
REG ADD HKEY_CURRENT_USER\Console\%~n0 /v FontWeight /t REG_DWORD /d 0x00000000 /f >nul

REM Enable Virtual Terminal Processing for proper ANSI escape sequences
powershell -Command "Set-ItemProperty -Path 'HKCU:\Console' -Name 'VirtualTerminalLevel' -Value 1 -Type DWORD" >nul 2>&1

for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"

:menu
cls
echo.
echo.
echo %ESC%[38;2;255;50;50m████████╗%ESC%[38;2;255;90;50m██╗  ██╗%ESC%[38;2;255;130;50m███████╗%ESC%[38;2;255;170;50m     ██████╗%ESC%[38;2;255;210;50m██╗     %ESC%[38;2;255;230;50m███████╗%ESC%[38;2;255;255;50m █████╗ %ESC%[38;2;255;255;100m███╗   ██╗%ESC%[38;2;255;255;150m███████╗%ESC%[38;2;255;255;200m██████╗%ESC%[0m
echo %ESC%[38;2;255;50;50m╚══██╔══╝%ESC%[38;2;255;90;50m██║  ██║%ESC%[38;2;255;130;50m██╔════╝%ESC%[38;2;255;170;50m    ██╔════╝%ESC%[38;2;255;210;50m██║     %ESC%[38;2;255;230;50m██╔════╝%ESC%[38;2;255;255;50m██╔══██╗%ESC%[38;2;255;255;100m████╗  ██║%ESC%[38;2;255;255;150m██╔════╝%ESC%[38;2;255;255;200m██╔══██╗%ESC%[0m
echo %ESC%[38;2;255;50;50m   ██║   %ESC%[38;2;255;90;50m███████║%ESC%[38;2;255;130;50m█████╗  %ESC%[38;2;255;170;50m    ██║     %ESC%[38;2;255;210;50m██║     %ESC%[38;2;255;230;50m█████╗  %ESC%[38;2;255;255;50m███████║%ESC%[38;2;255;255;100m██╔██╗ ██║%ESC%[38;2;255;255;150m█████╗  %ESC%[38;2;255;255;200m██████╔╝%ESC%[0m
echo %ESC%[38;2;255;50;50m   ██║   %ESC%[38;2;255;90;50m██╔══██║%ESC%[38;2;255;130;50m██╔══╝  %ESC%[38;2;255;170;50m    ██║     %ESC%[38;2;255;210;50m██║     %ESC%[38;2;255;230;50m██╔══╝  %ESC%[38;2;255;255;50m██╔══██║%ESC%[38;2;255;255;100m██║╚██╗██║%ESC%[38;2;255;255;150m██╔══╝  %ESC%[38;2;255;255;200m██╔══██╗%ESC%[0m
echo %ESC%[38;2;255;50;50m   ██║   %ESC%[38;2;255;90;50m██║  ██║%ESC%[38;2;255;130;50m███████╗%ESC%[38;2;255;170;50m    ╚██████╗%ESC%[38;2;255;210;50m███████╗%ESC%[38;2;255;230;50m███████╗%ESC%[38;2;255;255;50m██║  ██║%ESC%[38;2;255;255;100m██║ ╚████║%ESC%[38;2;255;255;150m███████╗%ESC%[38;2;255;255;200m██║  ██║%ESC%[0m
echo %ESC%[38;2;255;50;50m   ╚═╝   %ESC%[38;2;255;90;50m╚═╝  ╚═╝%ESC%[38;2;255;130;50m╚══════╝%ESC%[38;2;255;170;50m     ╚═════╝%ESC%[38;2;255;210;50m╚══════╝%ESC%[38;2;255;230;50m╚══════╝%ESC%[38;2;255;255;50m╚═╝  ╚═╝%ESC%[38;2;255;255;100m╚═╝  ╚═══╝%ESC%[38;2;255;255;150m╚══════╝%ESC%[38;2;255;255;200m╚═╝  ╚═╝%ESC%[0m
echo.
echo %ESC%[38;2;255;165;0m=======================================================================================================%ESC%[0m
echo.
echo %ESC%[38;2;255;140;0m====== Cleaning Options ======%ESC%[0m
echo %ESC%[38;2;255;180;50m1. Clean Temporary Files%ESC%[0m
echo %ESC%[38;2;255;180;50m2. Clean Browser Cache%ESC%[0m
echo %ESC%[38;2;255;180;50m3. Clean Windows Update Cache%ESC%[0m
echo %ESC%[38;2;255;180;50m4. Clean All%ESC%[0m
echo %ESC%[38;2;255;180;50m5. Exit%ESC%[0m
echo %ESC%[38;2;255;140;0m===========================%ESC%[0m
echo.
set /p choice=%ESC%[38;2;255;140;0mEnter your choice (1-5): %ESC%[0m

if "%choice%"=="1" goto cleanTemp
if "%choice%"=="2" goto cleanBrowser
if "%choice%"=="3" goto cleanUpdate
if "%choice%"=="4" goto cleanAll
if "%choice%"=="5" goto exit
goto menu

:cleanTemp
cls
echo.
echo.
echo %ESC%[38;2;0;180;0m████████╗%ESC%[38;2;20;190;20m███████╗%ESC%[38;2;40;200;40m███╗   ███╗%ESC%[38;2;60;210;60m██████╗ %ESC%[38;2;80;220;80m     ██████╗%ESC%[38;2;100;230;100m██╗     %ESC%[38;2;120;240;120m███████╗%ESC%[38;2;140;250;140m █████╗ %ESC%[38;2;50;255;50m███╗   ██╗%ESC%[38;2;0;255;100m███████╗%ESC%[38;2;0;255;150m██████╗%ESC%[0m
echo %ESC%[38;2;0;180;0m╚══██╔══╝%ESC%[38;2;20;190;20m██╔════╝%ESC%[38;2;40;200;40m████╗ ████║%ESC%[38;2;60;210;60m██╔══██╗%ESC%[38;2;80;220;80m    ██╔════╝%ESC%[38;2;100;230;100m██║     %ESC%[38;2;120;240;120m██╔════╝%ESC%[38;2;140;250;140m██╔══██╗%ESC%[38;2;50;255;50m████╗  ██║%ESC%[38;2;0;255;100m██╔════╝%ESC%[38;2;0;255;150m██╔══██╗%ESC%[0m
echo %ESC%[38;2;0;180;0m   ██║   %ESC%[38;2;20;190;20m█████╗  %ESC%[38;2;40;200;40m██╔████╔██║%ESC%[38;2;60;210;60m██████╔╝%ESC%[38;2;80;220;80m    ██║     %ESC%[38;2;100;230;100m██║     %ESC%[38;2;120;240;120m█████╗  %ESC%[38;2;140;250;140m███████║%ESC%[38;2;50;255;50m██╔██╗ ██║%ESC%[38;2;0;255;100m█████╗  %ESC%[38;2;0;255;150m██████╔╝%ESC%[0m
echo %ESC%[38;2;0;180;0m   ██║   %ESC%[38;2;20;190;20m██╔══╝  %ESC%[38;2;40;200;40m██║╚██╔╝██║%ESC%[38;2;60;210;60m██╔═══╝ %ESC%[38;2;80;220;80m    ██║     %ESC%[38;2;100;230;100m██║     %ESC%[38;2;120;240;120m██╔══╝  %ESC%[38;2;140;250;140m██╔══██║%ESC%[38;2;50;255;50m██║╚██╗██║%ESC%[38;2;0;255;100m██╔══╝  %ESC%[38;2;0;255;150m██╔══██╗%ESC%[0m
echo %ESC%[38;2;0;180;0m   ██║   %ESC%[38;2;20;190;20m███████╗%ESC%[38;2;40;200;40m██║ ╚═╝ ██║%ESC%[38;2;60;210;60m██║     %ESC%[38;2;80;220;80m    ╚██████╗%ESC%[38;2;100;230;100m███████╗%ESC%[38;2;120;240;120m███████╗%ESC%[38;2;140;250;140m██║  ██║%ESC%[38;2;50;255;50m██║ ╚████║%ESC%[38;2;0;255;100m███████╗%ESC%[38;2;0;255;150m██║  ██║%ESC%[0m
echo %ESC%[38;2;0;180;0m   ╚═╝   %ESC%[38;2;20;190;20m╚══════╝%ESC%[38;2;40;200;40m╚═╝     ╚═╝%ESC%[38;2;60;210;60m╚═╝     %ESC%[38;2;80;220;80m     ╚═════╝%ESC%[38;2;100;230;100m╚══════╝%ESC%[38;2;120;240;120m╚══════╝%ESC%[38;2;140;250;140m╚═╝  ╚═╝%ESC%[38;2;50;255;50m╚═╝  ╚═══╝%ESC%[38;2;0;255;100m╚══════╝%ESC%[38;2;0;255;150m╚═╝  ╚═╝%ESC%[0m
echo.
echo %ESC%[38;2;0;200;100m=======================================================================================================%ESC%[0m
echo.
echo %ESC%[38;2;0;220;50m[+] Cleaning Temporary Files...%ESC%[0m

REM Count and delete files in Windows Temp folder
echo %ESC%[38;2;0;220;50m┌─────────────────────────────────┐%ESC%[0m
echo %ESC%[38;2;0;220;50m│  CLEANING WINDOWS TEMP FOLDER   │%ESC%[0m
echo %ESC%[38;2;0;220;50m└─────────────────────────────────┘%ESC%[0m
set /a files_temp=0
set /a folders_temp=0
for %%i in ("%temp%\*.*") do set /a files_temp+=1
for /d %%i in ("%temp%\*") do set /a folders_temp+=1
del /q /s "%temp%\*.*" >nul 2>&1
for /d %%x in ("%temp%\*") do rd /s /q "%%x" >nul 2>&1
echo %ESC%[38;2;100;255;100m    ✓ Removed %files_temp% files and %folders_temp% folders from Windows Temp%ESC%[0m

REM Count and delete files in System Temp folder
echo.
echo %ESC%[38;2;0;220;50m┌─────────────────────────────────┐%ESC%[0m
echo %ESC%[38;2;0;220;50m│    CLEANING SYSTEM TEMP FOLDER   │%ESC%[0m
echo %ESC%[38;2;0;220;50m└─────────────────────────────────┘%ESC%[0m
set /a files_sys=0
set /a folders_sys=0
for %%i in ("C:\Windows\Temp\*.*") do set /a files_sys+=1
for /d %%i in ("C:\Windows\Temp\*") do set /a folders_sys+=1
del /q /s "C:\Windows\Temp\*.*" >nul 2>&1
for /d %%x in ("C:\Windows\Temp\*") do rd /s /q "%%x" >nul 2>&1
echo %ESC%[38;2;100;255;100m    ✓ Removed %files_sys% files and %folders_sys% folders from System Temp%ESC%[0m

REM Count and delete files in Prefetch folder
echo.
echo %ESC%[38;2;0;220;50m┌─────────────────────────────────┐%ESC%[0m
echo %ESC%[38;2;0;220;50m│     CLEANING PREFETCH FOLDER     │%ESC%[0m
echo %ESC%[38;2;0;220;50m└─────────────────────────────────┘%ESC%[0m
set /a files_prefetch=0
set /a folders_prefetch=0
for %%i in ("C:\Windows\Prefetch\*.*") do set /a files_prefetch+=1
for /d %%i in ("C:\Windows\Prefetch\*") do set /a folders_prefetch+=1
del /q /s "C:\Windows\Prefetch\*.*" >nul 2>&1
echo %ESC%[38;2;100;255;100m    ✓ Removed %files_prefetch% files and %folders_prefetch% folders from Prefetch%ESC%[0m

echo.
echo %ESC%[38;2;20;200;80m╔══════════════════════════════════════╗%ESC%[0m
echo %ESC%[38;2;20;200;80m║            CLEANUP SUMMARY           ║%ESC%[0m
echo %ESC%[38;2;20;200;80m╚══════════════════════════════════════╝%ESC%[0m
set /a total_files=%files_temp%+%files_sys%+%files_prefetch%
set /a total_folders=%folders_temp%+%folders_sys%+%folders_prefetch%
echo %ESC%[38;2;50;230;120m  ▶ Windows Temp: %files_temp% files, %folders_temp% folders%ESC%[0m
echo %ESC%[38;2;50;230;120m  ▶ System Temp:  %files_sys% files, %folders_sys% folders%ESC%[0m 
echo %ESC%[38;2;50;230;120m  ▶ Prefetch:     %files_prefetch% files, %folders_prefetch% folders%ESC%[0m
echo.
echo %ESC%[38;2;0;255;100m  ✅ TOTAL: %total_files% files and %total_folders% folders cleaned!%ESC%[0m
echo %ESC%[38;2;20;200;80m══════════════════════════════════════════%ESC%[0m
echo.
echo %ESC%[38;2;50;240;100mPress any key to continue...%ESC%[0m
pause >nul
goto menu

:cleanBrowser
cls
echo.
echo.
echo %ESC%[38;2;50;50;255m██████╗ %ESC%[38;2;75;75;255m██████╗ %ESC%[38;2;100;100;255m ██████╗%ESC%[38;2;125;125;255m██╗    ██╗%ESC%[38;2;150;150;255m███████╗%ESC%[38;2;175;175;255m███████╗%ESC%[38;2;200;200;255m██████╗ %ESC%[38;2;225;225;255m     ██████╗%ESC%[38;2;130;130;255m██╗     %ESC%[38;2;150;150;255m███████╗%ESC%[38;2;175;175;255m █████╗ %ESC%[38;2;200;200;255m███╗   ██╗%ESC%[0m
echo %ESC%[38;2;50;50;255m██╔══██╗%ESC%[38;2;75;75;255m██╔══██╗%ESC%[38;2;100;100;255m██╔═══██╗%ESC%[38;2;125;125;255m██║    ██║%ESC%[38;2;150;150;255m██╔════╝%ESC%[38;2;175;175;255m██╔════╝%ESC%[38;2;200;200;255m██╔══██╗%ESC%[38;2;225;225;255m    ██╔════╝%ESC%[38;2;130;130;255m██║     %ESC%[38;2;150;150;255m██╔════╝%ESC%[38;2;175;175;255m██╔══██╗%ESC%[38;2;200;200;255m████╗  ██║%ESC%[0m
echo %ESC%[38;2;50;50;255m██████╔╝%ESC%[38;2;75;75;255m██████╔╝%ESC%[38;2;100;100;255m██║   ██║%ESC%[38;2;125;125;255m██║ █╗ ██║%ESC%[38;2;150;150;255m███████╗%ESC%[38;2;175;175;255m█████╗  %ESC%[38;2;200;200;255m██████╔╝%ESC%[38;2;225;225;255m    ██║     %ESC%[38;2;130;130;255m██║     %ESC%[38;2;150;150;255m█████╗  %ESC%[38;2;175;175;255m███████║%ESC%[38;2;200;200;255m██╔██╗ ██║%ESC%[0m
echo %ESC%[38;2;50;50;255m██╔══██╗%ESC%[38;2;75;75;255m██╔══██╗%ESC%[38;2;100;100;255m██║   ██║%ESC%[38;2;125;125;255m██║███╗██║%ESC%[38;2;150;150;255m╚════██║%ESC%[38;2;175;175;255m██╔══╝  %ESC%[38;2;200;200;255m██╔══██╗%ESC%[38;2;225;225;255m    ██║     %ESC%[38;2;130;130;255m██║     %ESC%[38;2;150;150;255m██╔══╝  %ESC%[38;2;175;175;255m██╔══██║%ESC%[38;2;200;200;255m██║╚██╗██║%ESC%[0m
echo %ESC%[38;2;50;50;255m██████╔╝%ESC%[38;2;75;75;255m██║  ██║%ESC%[38;2;100;100;255m╚██████╔╝%ESC%[38;2;125;125;255m╚███╔███╔╝%ESC%[38;2;150;150;255m███████║%ESC%[38;2;175;175;255m███████╗%ESC%[38;2;200;200;255m██║  ██║%ESC%[38;2;225;225;255m    ╚██████╗%ESC%[38;2;130;130;255m███████╗%ESC%[38;2;150;150;255m███████╗%ESC%[38;2;175;175;255m██║  ██║%ESC%[38;2;200;200;255m██║ ╚████║%ESC%[0m
echo %ESC%[38;2;50;50;255m╚═════╝ %ESC%[38;2;75;75;255m╚═╝  ╚═╝%ESC%[38;2;100;100;255m ╚═════╝ %ESC%[38;2;125;125;255m ╚══╝╚══╝ %ESC%[38;2;150;150;255m╚══════╝%ESC%[38;2;175;175;255m╚══════╝%ESC%[38;2;200;200;255m╚═╝  ╚═╝%ESC%[38;2;225;225;255m     ╚═════╝%ESC%[38;2;130;130;255m╚══════╝%ESC%[38;2;150;150;255m╚══════╝%ESC%[38;2;175;175;255m╚═╝  ╚═╝%ESC%[38;2;200;200;255m╚═╝  ╚═══╝%ESC%[0m
echo.
echo %ESC%[38;2;80;80;255m=======================================================================================================%ESC%[0m
echo.
echo %ESC%[38;2;100;100;255m====== Browser Cache Cleaning Options ======%ESC%[0m
echo %ESC%[38;2;130;130;255m1. Google Chrome%ESC%[0m
echo %ESC%[38;2;130;130;255m2. Mozilla Firefox%ESC%[0m
echo %ESC%[38;2;130;130;255m3. Microsoft Edge%ESC%[0m
echo %ESC%[38;2;130;130;255m4. Clean All Browsers%ESC%[0m
echo %ESC%[38;2;130;130;255m5. Back to Main Menu%ESC%[0m
echo %ESC%[38;2;100;100;255m=========================================%ESC%[0m
echo.
set /p browser_choice=%ESC%[38;2;100;100;255mEnter your choice (1-5): %ESC%[0m

if "%browser_choice%"=="1" goto cleanChrome
if "%browser_choice%"=="2" goto cleanFirefox
if "%browser_choice%"=="3" goto cleanEdge
if "%browser_choice%"=="4" goto cleanAllBrowsers
if "%browser_choice%"=="5" goto menu
goto cleanBrowser

:cleanChrome
cls
echo %ESC%[38;2;100;100;255m[+] Cleaning Chrome Cache...%ESC%[0m
set /a chrome_files=0
for %%i in ("%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*") do set /a chrome_files+=1
del /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
echo %ESC%[38;2;150;150;255m    Removed %chrome_files% files from Chrome Cache%ESC%[0m
echo.
echo %ESC%[38;2;100;100;255mPress any key to return to Browser Menu...%ESC%[0m
pause >nul
goto cleanBrowser

:cleanFirefox
cls
echo %ESC%[38;2;100;100;255m[+] Cleaning Firefox Cache...%ESC%[0m
set /a firefox_files=0
for %%i in ("%APPDATA%\Mozilla\Firefox\Profiles\*.default\cache\*.*") do set /a firefox_files+=1
del /s /q "%APPDATA%\Mozilla\Firefox\Profiles\*.default\cache\*.*" >nul 2>&1
echo %ESC%[38;2;150;150;255m    Removed %firefox_files% files from Firefox Cache%ESC%[0m
echo.
echo %ESC%[38;2;100;100;255mPress any key to return to Browser Menu...%ESC%[0m
pause >nul
goto cleanBrowser

:cleanEdge
cls
echo %ESC%[38;2;100;100;255m[+] Cleaning Edge Cache...%ESC%[0m
set /a edge_files=0
for %%i in ("%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*") do set /a edge_files+=1
del /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
echo %ESC%[38;2;150;150;255m    Removed %edge_files% files from Edge Cache%ESC%[0m
echo.
echo %ESC%[38;2;100;100;255mPress any key to return to Browser Menu...%ESC%[0m
pause >nul
goto cleanBrowser

:cleanAllBrowsers
cls
echo %ESC%[38;2;100;100;255m[+] Cleaning All Browser Caches...%ESC%[0m
set /a chrome_files=0
set /a firefox_files=0
set /a edge_files=0

REM Chrome
echo %ESC%[38;2;100;100;255m    Cleaning Chrome Cache...%ESC%[0m
for %%i in ("%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*") do set /a chrome_files+=1
del /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
echo %ESC%[38;2;150;150;255m    Removed %chrome_files% files from Chrome Cache%ESC%[0m

REM Firefox
echo %ESC%[38;2;100;100;255m    Cleaning Firefox Cache...%ESC%[0m
for %%i in ("%APPDATA%\Mozilla\Firefox\Profiles\*.default\cache\*.*") do set /a firefox_files+=1
del /s /q "%APPDATA%\Mozilla\Firefox\Profiles\*.default\cache\*.*" >nul 2>&1
echo %ESC%[38;2;150;150;255m    Removed %firefox_files% files from Firefox Cache%ESC%[0m

REM Edge
echo %ESC%[38;2;100;100;255m    Cleaning Edge Cache...%ESC%[0m
for %%i in ("%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*") do set /a edge_files+=1
del /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
echo %ESC%[38;2;150;150;255m    Removed %edge_files% files from Edge Cache%ESC%[0m

echo.
echo %ESC%[38;2;100;100;255m======================================%ESC%[0m
set /a total_browser_files=%chrome_files%+%firefox_files%+%edge_files%
echo %ESC%[38;2;100;100;255m    BROWSER CLEANUP COMPLETED!%ESC%[0m
echo %ESC%[38;2;150;150;255m    Total: %total_browser_files% cache files removed%ESC%[0m
echo %ESC%[38;2;100;100;255m======================================%ESC%[0m
echo.
echo %ESC%[38;2;100;100;255mPress any key to return to Browser Menu...%ESC%[0m
pause >nul
goto cleanBrowser

:cleanUpdate
cls
echo.
echo.
echo %ESC%[38;2;160;32;240m██╗   ██╗%ESC%[38;2;170;42;250m██████╗ %ESC%[38;2;180;52;255m██████╗ %ESC%[38;2;190;62;255m █████╗ %ESC%[38;2;200;72;255m████████╗%ESC%[38;2;210;82;255m███████╗%ESC%[38;2;220;92;255m     ██████╗%ESC%[38;2;230;102;255m██╗     %ESC%[38;2;240;112;255m███████╗%ESC%[38;2;250;122;255m █████╗ %ESC%[38;2;255;132;255m███╗   ██╗%ESC%[0m
echo %ESC%[38;2;160;32;240m██║   ██║%ESC%[38;2;170;42;250m██╔══██╗%ESC%[38;2;180;52;255m██╔══██╗%ESC%[38;2;190;62;255m██╔══██╗%ESC%[38;2;200;72;255m╚══██╔══╝%ESC%[38;2;210;82;255m██╔════╝%ESC%[38;2;220;92;255m    ██╔════╝%ESC%[38;2;230;102;255m██║     %ESC%[38;2;240;112;255m██╔════╝%ESC%[38;2;250;122;255m██╔══██╗%ESC%[38;2;255;132;255m████╗  ██║%ESC%[0m
echo %ESC%[38;2;160;32;240m██║   ██║%ESC%[38;2;170;42;250m██████╔╝%ESC%[38;2;180;52;255m██║  ██║%ESC%[38;2;190;62;255m███████║%ESC%[38;2;200;72;255m   ██║   %ESC%[38;2;210;82;255m█████╗  %ESC%[38;2;220;92;255m    ██║     %ESC%[38;2;230;102;255m██║     %ESC%[38;2;240;112;255m█████╗  %ESC%[38;2;250;122;255m███████║%ESC%[38;2;255;132;255m██╔██╗ ██║%ESC%[0m
echo %ESC%[38;2;160;32;240m██║   ██║%ESC%[38;2;170;42;250m██╔═══╝ %ESC%[38;2;180;52;255m██║  ██║%ESC%[38;2;190;62;255m██╔══██║%ESC%[38;2;200;72;255m   ██║   %ESC%[38;2;210;82;255m██╔══╝  %ESC%[38;2;220;92;255m    ██║     %ESC%[38;2;230;102;255m██║     %ESC%[38;2;240;112;255m██╔══╝  %ESC%[38;2;250;122;255m██╔══██║%ESC%[38;2;255;132;255m██║╚██╗██║%ESC%[0m
echo %ESC%[38;2;160;32;240m╚██████╔╝%ESC%[38;2;170;42;250m██║     %ESC%[38;2;180;52;255m██████╔╝%ESC%[38;2;190;62;255m██║  ██║%ESC%[38;2;200;72;255m   ██║   %ESC%[38;2;210;82;255m███████╗%ESC%[38;2;220;92;255m    ╚██████╗%ESC%[38;2;230;102;255m███████╗%ESC%[38;2;240;112;255m███████╗%ESC%[38;2;250;122;255m██║  ██║%ESC%[38;2;255;132;255m██║ ╚████║%ESC%[0m
echo %ESC%[38;2;160;32;240m ╚═════╝ %ESC%[38;2;170;42;250m╚═╝     %ESC%[38;2;180;52;255m╚═════╝ %ESC%[38;2;190;62;255m╚═╝  ╚═╝%ESC%[38;2;200;72;255m   ╚═╝   %ESC%[38;2;210;82;255m╚══════╝%ESC%[38;2;220;92;255m     ╚═════╝%ESC%[38;2;230;102;255m╚══════╝%ESC%[38;2;240;112;255m╚══════╝%ESC%[38;2;250;122;255m╚═╝  ╚═╝%ESC%[38;2;255;132;255m╚═╝  ╚═══╝%ESC%[0m
echo.
echo %ESC%[38;2;180;52;255m=======================================================================================================%ESC%[0m
echo.
echo %ESC%[38;2;190;62;255m[+] Cleaning Windows Update Cache...%ESC%[0m
set /a update_files=0

echo %ESC%[38;2;190;62;255m    Stopping Windows Update Service...%ESC%[0m
net stop wuauserv >nul 2>&1

echo %ESC%[38;2;190;62;255m    Cleaning Update Cache...%ESC%[0m
for %%i in ("C:\Windows\SoftwareDistribution\*.*") do set /a update_files+=1
del /s /q "C:\Windows\SoftwareDistribution\*.*" >nul 2>&1

echo %ESC%[38;2;190;62;255m    Starting Windows Update Service...%ESC%[0m
net start wuauserv >nul 2>&1

echo.
echo %ESC%[38;2;190;62;255m======================================%ESC%[0m
echo %ESC%[38;2;190;62;255m    UPDATE CACHE CLEANUP COMPLETED!%ESC%[0m
echo %ESC%[38;2;230;102;255m    Total: %update_files% update files removed%ESC%[0m
echo %ESC%[38;2;190;62;255m======================================%ESC%[0m
echo.
echo %ESC%[38;2;190;62;255mPress any key to continue...%ESC%[0m
pause >nul
goto menu

:cleanAll
cls
echo.
echo %ESC%[38;2;255;100;100m[!] WARNING: This will perform a complete system cleanup. Continue? (Y/N)%ESC%[0m
choice /c YN /n
if errorlevel 2 goto menu

echo %ESC%[38;2;255;140;50m[+] Starting Full System Cleanup...%ESC%[0m
echo.
call :cleanTemp
echo %ESC%[38;2;255;140;50m[+] Temporary Files Cleanup Complete%ESC%[0m
echo.
call :cleanBrowser
echo %ESC%[38;2;255;140;50m[+] Browser Cache Cleanup Complete%ESC%[0m
echo.
call :cleanUpdate
echo %ESC%[38;2;255;140;50m[+] Windows Update Cache Cleanup Complete%ESC%[0m
echo.

echo %ESC%[38;2;255;140;50m============= FINAL SUMMARY =============%ESC%[0m
echo %ESC%[38;2;255;180;50m    Temporary Files: %total_files% files, %total_folders% folders%ESC%[0m
echo %ESC%[38;2;255;180;50m    Browser Cache: %total_browser_files% files%ESC%[0m
echo %ESC%[38;2;255;180;50m    Update Cache: %update_files% files%ESC%[0m
echo %ESC%[38;2;255;140;50m=======================================%ESC%[0m
echo.
echo %ESC%[38;2;255;140;50mPress any key to continue...%ESC%[0m
pause >nul
goto menu

:exit
cls
echo.
echo.
echo %ESC%[38;2;100;255;100m████████╗██╗  ██╗ █████╗ ███╗   ██╗██╗  ██╗    ██╗   ██╗ ██████╗ ██╗   ██╗██╗%ESC%[0m
echo %ESC%[38;2;100;255;100m╚══██╔══╝██║  ██║██╔══██╗████╗  ██║██║ ██╔╝    ╚██╗ ██╔╝██╔═══██╗██║   ██║██║%ESC%[0m
echo %ESC%[38;2;100;255;100m   ██║   ███████║███████║██╔██╗ ██║█████╔╝      ╚████╔╝ ██║   ██║██║   ██║██║%ESC%[0m
echo %ESC%[38;2;100;255;100m   ██║   ██╔══██║██╔══██║██║╚██╗██║██╔═██╗       ╚██╔╝  ██║   ██║██║   ██║╚═╝%ESC%[0m
echo %ESC%[38;2;100;255;100m   ██║   ██║  ██║██║  ██║██║ ╚████║██║  ██╗       ██║   ╚██████╔╝╚██████╔╝██╗%ESC%[0m
echo %ESC%[38;2;100;255;100m   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚═╝%ESC%[0m
echo.
echo %ESC%[38;2;50;255;50m=======================================================================================================%ESC%[0m
echo.
echo %ESC%[38;2;80;255;80mThank you for using The Cleaner!%ESC%[0m
timeout /t 2 >nul
exit