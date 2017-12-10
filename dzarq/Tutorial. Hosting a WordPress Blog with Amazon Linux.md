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
define('AUTH_KEY',         'g@LuAC-Oyscx2Z}&hVjqM4]Z-{~73BW3~j @M2-7,9Y8wnPsh^-od*9+?=&z@0vo');
define('SECURE_AUTH_KEY',  ':5WZ(!=fA)|YXZ^LIBX4Q<2I^xklXvh^6DryaP*{3( p}`}TLN`HFLmXQL0y<S-=');
define('LOGGED_IN_KEY',    't%7{Hn{|QR+b/w]w12{v-!Lg)5Ox<n?~{/rfxHSoJPY#&EA+I9(E)Ai$0(Q6qlss');
define('NONCE_KEY',        'x%-ia-# D@hI+&)m%P|,l=`lW 9HlM!4H`={[2/p-esj29(!4q2Sb|*m%Ck+r*r)');
define('AUTH_SALT',        'pA;Cma*M:kU9Hz#H`W)~)RFm+!$8bfc T8Rwkf25,Q1&!u,A-Mxg-AG[(mZ=vfk]');
define('SECURE_AUTH_SALT', '{5>LUw~DE*7P[5gg#oSy}zL|l4H/PhUkX4:HFrg]&S)S`g#{E:72)wq;d#=>J!*#');
define('LOGGED_IN_SALT',   'A&|} MV{/;<vIu;([Eu65+qrM^2}{1|_p6)z8JlL`wqZ6}%0ZrnxNN(fd]|,<JMK');
define('NONCE_SALT',       'hAZL,INlxb(hjurr%RDXO-o>`h#u`YJ |zGK*lR|}/uBE6%p~5dPj_(0[-W@S|XO');

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
