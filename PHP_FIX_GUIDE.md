# حل مشكلة عرض كود PHP بدلاً من تنفيذه

## المشكلة:
عند فتح صفحة `state_engine.php` تظهر الأكواد بدلاً من تنفيذها.

## الحلول:

### 1. تحقق من إعدادات Apache
افتح ملف `C:\xampp\apache\conf\httpd.conf` وتأكد من وجود هذه الأسطر:

```apache
LoadModule php_module "C:/xampp/php/php8apache2_4.dll"
AddType application/x-httpd-php .php
PHPIniDir "C:/xampp/php"
```

### 2. تحقق من ملف php.ini
افتح ملف `C:\xampp\php\php.ini` وتأكد من:
```ini
short_open_tag = On
```

### 3. إعادة تشغيل XAMPP
1. أوقف Apache و MySQL
2. شغلهم مرة أخرى

### 4. تحقق من امتداد الملف
تأكد من أن الملف ينتهي بـ `.php` وليس `.php.txt`

### 5. اختبر الملف البسيط أولاً
افتح في المتصفح:
```
http://192.168.0.160/robot_arm/test_php.php
```

### 6. إذا لم يعمل، جرب هذا الحل:
أنشئ ملف `info.php` جديد:

```php
<?php
phpinfo();
?>
```

ثم افتحه في المتصفح.

### 7. تحقق من إعدادات المتصفح
- تأكد من أن JavaScript مفعل
- جرب متصفح آخر
- امسح cache المتصفح

### 8. تحقق من Firewall
- تأكد من أن Apache مسموح له في Windows Firewall

## إذا استمرت المشكلة:

### الحل البديل - إنشاء ملف HTML مع JavaScript:
```html
<!DOCTYPE html>
<html>
<head>
    <title>Robot Arm State Engine</title>
</head>
<body>
    <h1>Robot Arm State Engine</h1>
    <div id="data"></div>
    
    <script>
        fetch('http://192.168.0.160/robot_arm/get_run_pose.php')
            .then(response => response.json())
            .then(data => {
                document.getElementById('data').innerHTML = 
                    '<pre>' + JSON.stringify(data, null, 2) + '</pre>';
            });
    </script>
</body>
</html>
```

## للاختبار السريع:
افتح هذا الرابط في المتصفح:
```
http://192.168.0.160/robot_arm/test_setup.php
```

يجب أن ترى JSON response وليس كود PHP. 