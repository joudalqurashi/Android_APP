@echo off
echo ========================================
echo    Robot Arm Control System Setup
echo ========================================
echo.

echo [1/4] Checking Flutter installation...
flutter --version
if %errorlevel% neq 0 (
    echo ERROR: Flutter is not installed or not in PATH
    echo Please install Flutter from https://flutter.dev/docs/get-started/install
    pause
    exit /b 1
)

echo.
echo [2/4] Installing Flutter dependencies...
flutter pub get
if %errorlevel% neq 0 (
    echo ERROR: Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo [3/4] Creating PHP directory structure...
if not exist "C:\xampp\htdocs\robot_arm" (
    mkdir "C:\xampp\htdocs\robot_arm"
    echo Created directory: C:\xampp\htdocs\robot_arm
) else (
    echo Directory already exists: C:\xampp\htdocs\robot_arm
)

echo.
echo [4/4] Copying PHP files...
xcopy /E /I /Y "php\*" "C:\xampp\htdocs\robot_arm\"
if %errorlevel% neq 0 (
    echo ERROR: Failed to copy PHP files
    echo Please make sure XAMPP is installed and the htdocs directory exists
    pause
    exit /b 1
)

echo.
echo ========================================
echo           Setup Complete!
echo ========================================
echo.
echo Next steps:
echo 1. Start XAMPP (Apache and MySQL)
echo 2. Import php/database.sql into phpMyAdmin
echo 3. Test web interface: http://localhost/robot_arm/state_engine.php
echo 4. Run Flutter app: flutter run
echo.
echo For detailed instructions, see README.md
echo.
pause 