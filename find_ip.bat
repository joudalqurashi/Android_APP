@echo off
echo Finding your computer's IP address...
echo.

REM Get the IP address of the WiFi adapter
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do (
    set ip=%%a
    set ip=!ip: =!
    echo Your IP address is: !ip!
    echo.
    echo Use this IP in your Flutter app: http://!ip!/robot_arm
    echo.
    goto :found
)

:found
echo Press any key to continue...
pause >nul 