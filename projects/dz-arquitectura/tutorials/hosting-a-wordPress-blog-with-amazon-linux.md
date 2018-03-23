# Tutorial: Hosting a WordPress Blog with Amazon Linux
[Original URL](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/hosting-wordpress.html)  


```
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
ls
	latest.tar.gz  wordpress
rm latest.tar.gz

sudo service mysqld status (debería estar arrancado)

mysql -u root -p
mysql> CREATE USER 'wordpress-user'@'localhost' IDENTIFIED BY 'your_strong_password';
	Query OK, 0 rows affected (0.00 sec)

mysql> CREATE DATABASE `wordpress-db`;
mysql> GRANT ALL PRIVILEGES ON `wordpress-db`.* TO "wordpress-user"@"localhost";
mysql> FLUSH PRIVILEGES;

mysql> exit
Bye


[ec2-user ~]$ cd wordpress/
[ec2-user wordpress]$ cp wp-config-sample.php wp-config.php

nano wp-config.php

define('DB_NAME', 'wordpress-db');
define('DB_USER', 'wordpress-user');
define('DB_PASSWORD', 'your_strong_password');

```

Generates Key to put in config.php  
https://api.wordpress.org/secret-key/1.1/salt/
```
define('AUTH_KEY',         'KpHtC|gJgLo)|)>N@EzN;`RrO+kG*hu3brA}y0/r3/^uIftI-o.t6T$6}HB7NfHb');
define('SECURE_AUTH_KEY',  'rxzkxv_T{H&R$IX@f$zYJ^(vCBBa(/!]co9 _K-D&4HT2/zI{KdbdT&Dq[0:%{Sw');
define('LOGGED_IN_KEY',    'f5th8W3.oti-<IJ|n)BF;6*N53>i|W_/FE{Mqk@fKZZpgI:gzZ=|,ydT6++|t<OZ');
define('NONCE_KEY',        'srRx5P{7+1+1dYB69o>d.wvRdH=SB3A2b47YSx^=*zx=d)w+10PB++8{d!%Efh 4');
define('AUTH_SALT',        'bJ1)81ne77P|U+hK+U mIdOB@Uosls_+*=!CbTKL+hFZB!-^2.ynE vNSXDOx>5j');
define('SECURE_AUTH_SALT', ' mr;1n1}.gGhFY?!<vL|!<::hwj52ns9&rANCr6}|z2U|b<E,V)!|qQh;l Rm~N|');
define('LOGGED_IN_SALT',   ';@|4vtT/s0$eQrrsY1=5E#+QDbLLD:BhAx?u,h{w$ve7+0<_>2,|FlyUp0:J#3OK');
define('NONCE_SALT',       'pFSmE56=$EuAN_H*R?v31-Bcg[50iS3a(od`lz[{bMOufsG7f4WIgz)/TYMuf<JZ');
```

mkdir /var/www/html
cp -r wordpress/* /var/www/html

WP Permalinks

sudo nano /etc/httpd/conf/httpd.conf
	<Directory "/var/www/html">.
	Change the AllowOverride None line in the above section to read AllowOverride All.

//To fix file permissions for the Apache web server
sudo chown -R apache /var/www
sudo chgrp -R apache /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
sudo service httpd restart


//To run the WordPress installation script
sudo chkconfig httpd on
sudo chkconfig mysqld on

```
