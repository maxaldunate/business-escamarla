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

### Improve Monitoring
* [Monitoring Memory and Disk Metrics for Amazon EC2 Linux Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/mon-scripts.html)

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


* Stats of the instance
`./mon-get-instance-stats.pl --recent-hours=12`



### AWS Systems Manager

Install or Update the SSM Agent  
https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/install-CloudWatch-Agent-on-first-instance.html?shortFooter=true  

```bash
yum install -y https://s3.eu-west-1.amazonaws.com/amazon-ssm-eu-west-1/latest/linux_amd64/amazon-ssm-agent.rpm
status amazon-ssm-agent

# https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-agent-logs.html?shortFooter=true
/var/log/amazon/ssm/amazon-ssm-agent.log
/var/log/amazon/ssm/errors.log
/etc/amazon/ssm/seelog.xml

#  UN INSTALL
sudo yum erase amazon-ssm-agent –y

```


### Stress

```bash
yum install -y stress
stress --cpu 2 --io 1 --vm 1 --vm-bytes 128M --timeout 10s --verbos
```


### Pending
* Autoscaling Group

