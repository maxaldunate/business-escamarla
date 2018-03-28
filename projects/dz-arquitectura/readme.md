# Project www.dzarquitectura.com

### Previous Steps
* [Installing a LAMP Web Server on Amazon Linux](installing-a-lamp-web-server-on-amazon-linux.md)
* [Hosting a WordPress Blog with Amazon Linux](hosting-a-wordPress-blog-with-amazon-linux.md)

### Basic Steps

* Domain Name transfer
* Forwarded emails
* Tagging
* Snapshot
* Restore Database Backup
* Wordpress Installing process
* File Access using WinSCP
* Alarms
* lamp script en [lamp.sh](lamp.sh)
* [S3 role policy for S3 access](Role.Policy.S3.access.md)
* [Basics Details](basic.md)

### Improvements

* RDS MySql & Connect to
* Reinstall phpMyAdmin
* [Improvements Details](improvements.md)

### Cloud Formation

* Define Resources
* CF Template Samples
* CF Template
* [Cloud Formation Details](cloud-formation.md)

### ELB, CloudFront & SSL Certificates
* CloudFront 
* [ELB, CloudFront & SSL Certificates Details](elb-cf-ssl.md)
* Improve Security Group for ELB, accessing from CloudFront

### IMprove Monitoring
* [Monitoring Memory and Disk Metrics for Amazon EC2 Linux Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/mon-scripts.html?shortFooter=true#using_put_script)

* Install Packages. Download and unzip **aws-scripts-mon**
```bash
# install
sudo yum install perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https -y
# download
curl https://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.2.zip -O
# run
unzip CloudWatchMonitoringScripts-1.2.2.zip
rm CloudWatchMonitoringScripts-1.2.2.zip
cd aws-scripts-mon

```

* Verify
`./mon-put-instance-data.pl --mem-util --verify --verbose`

`crontab -e`
`nano /etc/crontab`

`*/5 * * * * ~/aws-scripts-mon/mon-put-instance-data.pl --mem-used-incl-cache-buff --mem-util --disk-space-util --disk-path=/ --from-cron`

`/var/log/cron`

### Pending
* Autoscaling Group

