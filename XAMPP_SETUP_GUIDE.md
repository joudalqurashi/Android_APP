# XAMPP Setup Guide for Robot Arm Mobile App

## Prerequisites
- XAMPP installed and running
- Your computer and mobile device on the same WiFi network

## Step 1: Database Setup

1. **Start XAMPP Control Panel**
2. **Start MySQL service** (click "Start" next to MySQL)
3. **Run the database setup script:**
   ```bash
   setup_database.bat
   ```
   Or manually import the database:
   - Open phpMyAdmin (http://localhost/phpmyadmin)
   - Create a new database called `robot_arm_db`
   - Import the `php/database.sql` file

## Step 2: Configure XAMPP for External Access

### 2.1 Configure Apache (httpd.conf)
1. Open `C:\xampp\apache\conf\httpd.conf`
2. Find the line: `Listen 80`
3. Change it to: `Listen 0.0.0.0:80`
4. Find the `<Directory>` section and ensure it allows external access:
   ```apache
   <Directory "C:/xampp/htdocs">
       Options Indexes FollowSymLinks Includes ExecCGI
       AllowOverride All
       Require all granted
   </Directory>
   ```

### 2.2 Configure MySQL (my.ini)
1. Open `C:\xampp\mysql\bin\my.ini`
2. Find the line: `bind-address = 127.0.0.1`
3. Change it to: `bind-address = 0.0.0.0`
4. Or comment it out: `# bind-address = 127.0.0.1`

### 2.3 Restart XAMPP Services
1. Stop Apache and MySQL in XAMPP Control Panel
2. Start them again

## Step 3: Configure Windows Firewall

1. **Open Windows Defender Firewall**
2. **Click "Allow an app or feature through Windows Defender Firewall"**
3. **Click "Change settings"**
4. **Click "Allow another app"**
5. **Browse to `C:\xampp\apache\bin\httpd.exe`**
6. **Make sure both Private and Public are checked**
7. **Repeat for MySQL: `C:\xampp\mysql\bin\mysqld.exe`**

## Step 4: Find Your Computer's IP Address

1. **Open Command Prompt**
2. **Run:** `ipconfig`
3. **Look for your WiFi adapter's IPv4 address**
   - Usually starts with `192.168.` or `10.0.`
   - Example: `192.168.1.100`

## Step 5: Update Flutter App IP Address

1. **Open `lib/main.dart`**
2. **Find the baseUrl line (around line 48)**
3. **Update it with your computer's IP address:**
   ```dart
   final String baseUrl = 'http://YOUR_COMPUTER_IP/robot_arm';
   ```
   Example: `http://192.168.1.100/robot_arm`

## Step 6: Test the Setup

1. **On your computer, test:**
   - http://localhost/robot_arm/get_run_pose.php
   - Should return JSON data

2. **On your mobile device, test:**
   - http://YOUR_COMPUTER_IP/robot_arm/get_run_pose.php
   - Should return the same JSON data

## Troubleshooting

### "Not Found" Error
- Check that Apache is running
- Verify the robot_arm folder is in `C:\xampp\htdocs\`
- Check Windows Firewall settings
- Ensure your computer and mobile are on the same network

### Database Connection Error
- Verify MySQL is running
- Check that the database `robot_arm_db` exists
- Verify the database credentials in `php/config.php`

### Mobile Can't Connect
- Check your computer's IP address hasn't changed
- Verify both devices are on the same WiFi network
- Try disabling Windows Firewall temporarily for testing

## Security Notes

⚠️ **Important:** This setup allows external access to your XAMPP server. For production use:
- Use HTTPS
- Implement proper authentication
- Restrict access to specific IP addresses
- Use a proper web server instead of XAMPP 