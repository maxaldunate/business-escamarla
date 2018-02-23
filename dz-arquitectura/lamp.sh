#Install Apache 24, Php 70 & phpMyAdmin 476
#!/bin/bash
sudo yum update -y
sudo yum install -y httpd24 php70 php70-mysqlnd
sudo chkconfig httpd on
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www
sudo find /var/www -type d -exec sudo chmod 2775 {} \;
sudo find /var/www -type f -exec sudo chmod 0664 {} \;
sudo yum install -y php70-mbstring.x86_64 php70-zip.x86_64
sudo service httpd restart
cd /var/www/html
wget https://files.phpmyadmin.net/phpMyAdmin/4.7.6/phpMyAdmin-4.7.6-all-languages.tar.gz
tar -xvzf phpMyAdmin-4.7.6-all-languages.tar.gz
mv phpMyAdmin-4.7.6-all-languages phpMyAdmin
rm phpMyAdmin-4.7.6-all-languages.tar.gz
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
#To test everything is ok:
#http://ip_address/
#Amazon Linux AMI Test Page
#http://ip_address/phpMyAdmin
#Welcome to phpMyAdmin
#http://ip_address/phpinfo.php
#PHP Version 7.0.25