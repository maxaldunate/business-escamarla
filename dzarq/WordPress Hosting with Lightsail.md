Mini-Project
## WordPress Hosting with Lightsail

#### dzarquitectura.com
#### escamarla.org

#### Tags
project: escamarla-org-wp

#### Hosted Zone
escamarla-org-wp-hz1

#### Static IP	52.16.121.194  
http://escamarla.eu  
http://www.escamarla.eu

**Name Servers**
ns-1297.awsdns-34.org.  
ns-562.awsdns-06.net.  
ns-1799.awsdns-32.co.uk.  
ns-17.awsdns-02.com.  

**Extract password from bitname**
```
~$ cat bitnami_application_password
2BtX4tWh5s3c
```

**New Wordpress Lightsail mounted**
http://52.16.121.194/wp-admin
usu	user
psw	2BtX4tWh5s3c

**Plugin UpdraftPlus**
Backup Dropbox/Apps/UpdraftPlus.Com  
Connect to dropbox!

**_Old_ Wordpress**
http://www.dzarquitectura/wp-admin
usr admin  
psw Aluska2  

**Pending things**
* Ftp Access 
* Restore Wordpress
* Hosted Zones and Records!!!



Escamarla.es
Registar data
Name servers
ns-1471.awsdns-55.org
ns-177.awsdns-22.com
ns-1674.awsdns-17.co.uk
ns-613.awsdns-12.net

SOA ns-1471.awsdns-55.org. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400

Escamarla.org
Registar data
Name servers
ns-1269.awsdns-30.org
ns-1702.awsdns-20.co.uk
ns-559.awsdns-05.net
ns-461.awsdns-57.com

SOA ns-1269.awsdns-30.org. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400

Escamarla.eu
Registar data
Name servers
ns-1297.awsdns-34.org
ns-562.awsdns-06.net
ns-1799.awsdns-32.co.uk
ns-17.awsdns-02.com



Transferencia de dominio 

dzarquitectura.com 
Desactivar renovación automática
expira el 31.12.2017
Su código de autorización
$fd.7ijb


elcaramelo.com
Desactivar renovación automática
expira el 21.02.2018
Su código de autorización
nMMJ6*28qd6i

elcaramelo.es 
Desactivar renovación automática
expira el 21.02.2018

Tags
Name		wp-vpc
Project		Wordpress
IsDefault	Yes

Install LAMP on Centos7
https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-centos-7
Install WordPress on CentOS 7
https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-on-centos-7


sudo -i
yum update
yum install httpd -y
systemctl start httpd.service
try http://ip
systemctl enable httpd.service
try curl http://icanhazip.com
yum install mariadb-server mariadb
systemctl start mariadb
mysql_secure_installation
put the password FIrst enter blank
luego bobcIt0 dos veces
luego Y, n, n & Y
systemctl enable mariadb.service

yum install php php-mysql -y
systemctl restart httpd.service


yum search php-

yum install nano -y
nano /var/www/html/info.php
"<?php phpinfo(); ?>"

firewall-cmd --permanent --zone=public --add-service=http 
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload


http://ip/info.php




mysql -u root -p
psw bobcIt0 
CREATE DATABASE wordpress;
CREATE USER wordpressuser@localhost IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
exit

yum install php-gd -y
service httpd restart
yum install wget -y
cd ~
wget http://wordpress.org/latest.tar.gz

tar xzvf latest.tar.gz
rsync -avP ~/wordpress/ /var/www/html/
mkdir /var/www/html/wp-content/uploads
chown -R apache:apache /var/www/html/*

--Configure Wordpress
cd /var/www/html
cp wp-config-sample.php wp-config.php
nano wp-config.php

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wordpressuser');

/** MySQL database password */
define('DB_PASSWORD', 'password');


Step Four — Complete Installation Through the Web Interface












escamarla.es
ElasticIp 52.31.166.253

Tutorial: Installing a LAMP Web Server on Amazon Linux
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/install-LAMP.html
ssh -i key-pair.pem ec2-user@$ElasticIp
sudo yum update -y
sudo yum install -y httpd24 php70 mysql56-server php70-mysqlnd
sudo service httpd start
sudo chkconfig httpd on
chkconfig --list httpd
	Here, httpd is on in runlevels 2, 3, 4, and 5 (which is what you want to see).
	http://52.31.166.253/

ls -l /var/www
    total 16
    drwxr-xr-x 2 root root 4096 Jul 12 01:00 cgi-bin
    drwxr-xr-x 3 root root 4096 Aug  7 00:02 error
    drwxr-xr-x 2 root root 4096 Jan  6  2012 html
    drwxr-xr-x 3 root root 4096 Aug  7 00:02 icons
    drwxr-xr-x 2 root root 4096 Aug  7 21:17 noindex

sudo usermod -a -G apache ec2-user

logout
exit 

groups
	ec2-user wheel apache

sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;

echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
http://52.31.166.253/phpinfo.php
	PHP Version 7.0.25
sudo yum list installed httpd24 php70 mysql56-server php70-mysqlnd
rm /var/www/html/phpinfo.php

To secure the MySQL server
sudo service mysqld start
	Starting mysqld:                                           [  OK  ]
sudo mysql_secure_installation
	press enter
	add root pws bobcIt0
	Type Y to remove the anonymous user accounts.
	Type Y to disable the remote root login.
	Type Y to remove the test database.
	Type Y to reload the privilege tables and save your changes.
sudo service mysqld stop
sudo chkconfig mysqld on

Install phpMyAdmin
sudo yum install -y php70-mbstring.x86_64 php70-zip.x86_64
sudo service httpd restart
cd /var/www/html
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
tar -xvzf phpMyAdmin-latest-all-languages.tar.gz
mv phpMyAdmin-4.7.5-all-languages phpMyAdmin
sudo service mysqld start

http://escamarla.es/phpMyAdmin/

Install WordPress
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/hosting-wordpress.html

wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
ls
	latest.tar.gz  wordpress
sudo service mysqld start
mysql -u root -p
	root psw bobcIt0
	your_strong_password: bobcIt0
CREATE USER 'wordpress-user'@'localhost' IDENTIFIED BY 'your_strong_password';
CREATE DATABASE `wordpress-db`;
GRANT ALL PRIVILEGES ON `wordpress-db`.* TO "wordpress-user"@"localhost";
FLUSH PRIVILEGES;
exit

cd wordpress/
cp wp-config-sample.php wp-config.php
nano wp-config.php
	define('DB_NAME', 'wordpress-db');
	define('DB_USER', 'wordpress-user');
	define('DB_PASSWORD', 'your_strong_password');

To modify in the same siteGoes to ...	
https://api.wordpress.org/secret-key/1.1/salt/
     define('AUTH_KEY',         '2XF+ReXfT5xj|S+Et0EoNx;Db?X/il+)U:jX`fB#M#A2UQ1RA&&p.WKC-( |a6Nl');
     define('SECURE_AUTH_KEY',  'MUU?2P13jfB9AH<!mO]Cy~Bo@?AbC{&+78RmFn #zG}9F]-+R5qbEzP#N*8s+CIr');
     define('LOGGED_IN_KEY',    '_%a-Q.. 3)/]oM6W)O.N?Cz@r|p|rpb|5}UQX1XI%f7.|cKycYx7z899*yov@+1|');
     define('NONCE_KEY',        '|w_.?pfgd06A0LF| DpH-IGkxN~DQ`B +V78+]FBd|f6(-9 |?8^.W?1d`.k;s_<');
     define('AUTH_SALT',        '[s4ywo4^ ~E@8^-|o`8x`HxNlid>9c(M<PxdOt~CU4arrS;Nvv0i1/_j[/X]d..E');
     define('SECURE_AUTH_SALT', 'uw<bi4/r0`[P+.XW<BE4EvFr~#l<jgykS%%,W|q9l<`{OF3aZ@kQqffqH>9u(QPI');
     define('LOGGED_IN_SALT',   'qx~T^/tPEZ ?&$kZl1IvHxF05xI_RgEEyL&SV`B7x-,~B;OnmfI5|d-^|/UiqKLB');
     define('NONCE_SALT',       'PS0n*P^|:Ph@_oqFh39n,:vVwx-TmU/B#G#03?rP3G@+r@1k->(?/7lRA&.1^ENL');


cp /var/www/html/wordpress/wp-config.php wp-config.php
cp wp-config.php /var/www/html/wordpress/wp-config.php


ESTE NO HA FUNCIONADOcp
cp -r wordpress/* /var/www/html/

sudo nano /etc/httpd/conf/httpd.conf
	at <Directory "/var/www/html">.
	AllowOverride None  --change by--> AllowOverride All
	
sudo chown -R apache /var/www
sudo chgrp -R apache /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
sudo service httpd restart
sudo chkconfig httpd on
sudo chkconfig mysqld on
sudo service mysqld status
	is running
	
------------------ **************** ------------------ **************** ------------------ **************** 
title dzarquitectura
usu root
psw asd@Dfge45&a

copiado carpeta de plugins /var/www/html/dzarquitectura/wp-content/plugins/*

df -k


