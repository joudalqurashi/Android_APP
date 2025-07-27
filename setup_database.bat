@echo off
echo Setting up Robot Arm Database in XAMPP...
echo.

REM Check if XAMPP is running
echo Checking if XAMPP MySQL is running...
netstat -an | findstr ":3306" >nul
if %errorlevel% neq 0 (
    echo ERROR: XAMPP MySQL is not running!
    echo Please start XAMPP Control Panel and start MySQL service first.
    pause
    exit /b 1
)

echo MySQL is running. Importing database...
echo.

REM Import the database
mysql -u root -p < php/database.sql

if %errorlevel% equ 0 (
    echo.
    echo Database setup completed successfully!
    echo.
    echo Next steps:
    echo 1. Make sure your XAMPP Apache server is running
    echo 2. Configure your firewall to allow connections on port 80
    echo 3. Update the IP address in your Flutter app to match your computer's IP
    echo.
) else (
    echo.
    echo ERROR: Database import failed!
    echo Please check:
    echo 1. XAMPP MySQL is running
    echo 2. You have proper permissions
    echo 3. The database.sql file exists in the php folder
    echo.
)

pause 