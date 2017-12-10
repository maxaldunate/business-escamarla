# Tutorial: Installing a LAMP Web Server on Amazon Linux

[Original URL](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/install-LAMP.html)  


```
ssh -i key.pem uc2-user@elasticIp
sudo yum update -y
sudo yum install -y httpd24 php70 php70-mysqlnd
sudo service httpd start
// Check in brorwser Apache installed http://elasticIp

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

--you nedd to logout
logout
groups
	ec2-user wheel apache

sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;

echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
http://elasticIp/phpinfo.php
	PHP Version 7.0.25
rm /var/www/html/phpinfo.php
	
// Installing MySql Server and phpAdmin
sudo yum install -y mysql56-server
	
//To secure the MySQL server
sudo service mysqld start
	many things ....
	Starting mysqld:                                           [  OK  ]
sudo mysql_secure_installation
	first option press enter
	add root linux pws ...
	Type Y to remove the anonymous user accounts.
	Type Y to disable the remote root login.
	Type Y to remove the test database.
	Type Y to reload the privilege tables and save your changes.
sudo service mysqld stop
sudo chkconfig mysqld on


// Install phpMyAdmin
sudo yum install -y php70-mbstring.x86_64 php70-zip.x86_64
sudo service httpd restart
cd /var/www/html
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
tar -xvzf phpMyAdmin-latest-all-languages.tar.gz
mv phpMyAdmin-4.7.5-all-languages phpMyAdmin
sudo service mysqld start

rm phpMyAdmin-latest-all-languages.tar.gz

```