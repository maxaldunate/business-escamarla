### Project dzarquitectura.com

* WordPress Hosting with Lightsail  
  So easy, but can't access to each resource from aws console  
  Turn it off.  
   
* Domain Name transfer from 1&1 to Aws Route 53
  - dzarquitectura.com  (Código de Autorizacion)
    Name Servers on Hosted Zones
    ns-2046.awsdns-63.co.uk
    ns-1465.awsdns-55.org
    ns-933.awsdns-52.net
    ns-233.awsdns-29.com
  - dot.es no authroization code   
    Domain transfer failed: [Registry error - 2400 : Command failed (541 Invalid attribute value;   
    INVALID CONTACT [ADMINCONTACT (Invalid command format; The Request on the Contact could not be made.   
    The identification entered is not valid. Make sure that the Identification entered is correct according to  
    the Type of Identification in question.)])]

* Forwarded emails with  
  https://improvmx.com/

* Project Tags
  - Name		Resource Name
  - IsDefault	Yes/No
  - Project		dzarq

* AWS Resources
  - VPC: Default
  - Subnets: 3 in total, one per each AZ
  - Route Table 1
  - IGW 1
  - DHCP Options
  - Elastic IP 34.251.135.23
  - Network ACL 1 
  - Security Groups
  - 	1. web-server
  - 	2. RDS
	

* Tutorial: [Installing a LAMP Web Server on Amazon Linux](Tutorial.%20Installing%20a%20LAMP%20Web%20Server%20on%20Amazon%20Linux.md)
  - [AWS Tutorial URL](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/install-LAMP.html)

* Snapshot Created "Lamp&WpOnBlogFolder"
	
* Tutorial: [Hosting a WordPress Blog with Amazon Linux](Tutorial.%20Hosting%20a%20WordPress%20Blog%20with%20Amazon%20Linux.md)
  - [AWS Tutorial URL](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/hosting-wordpress.html)

* Restore Database Backup
  - db user/dzarq-user-db
  - your_strong_password/rab4nItos
  - database/db363458885
  - with zipped file
  - from http://www.dzarquitectura.com/phpMyAdmin  (Logging Ok)
  
* Create Bucket
  - bucket name: "dzarq"
  - upload wordpress backup files
 
* Create IAM Role
  - Role "WebAndDb-Role"
  - Add Policy "access-to-dzarq-bucket"  
    Use this policy tutorial and example. [Role.Policy.S3.access.md](Role.Policy.S3.access.md)  
  - Attach the IAM Role to the instance

* Copy files from S3 to ec2 instance
  - arn:aws:s3:::dzarq
  - aws s3 cp s3://mybucket . --recursive

* Wordpress Installing process
  - Url http://www.dzarquitectura.com/wp-login.php
  - Choose "español"
  - Titulo del Sitio DzArquitectura
  - Nombre de usario deboritah
  - 2r4dyhHJcdn6Mf^j@p
  - maxaldunate@gmail.com
  - Final result: http://www.dzarquitectura.com/

* File Access using WinSCP
  - Use access with key for ec2-user
  - Create link ´$ ln -s /var/www/html ~/docroot´
 
* Snapshot Created "WordPress-DzArq"

* 3 alarmas created
