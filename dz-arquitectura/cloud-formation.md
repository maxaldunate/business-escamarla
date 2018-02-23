## Project dzarquitectura.com
### AWS Cloud Formation

Elementos a generar dzarqImpro

- VPC
- SG
- Subnets
- AutoScaling
- IAM Role for RDS
- IAM Role to run CloudFormation
- AMI with Lamp
- Key Pairs
- ELB
- EIP
- Alarms & Installed Agents
- NACL for private subnet
- RT for each subnet
- HTTPS
- Bastion Host

```
aws configure 
Default region [eu-west-1]

aws s3 cp dzarq.json s3://dzarq/cli/dzarq.json

aws cloudformation create-stack --stack-name "dzarq-improvements" --template-url "https://s3-eu-west-1.amazonaws.com/dzarq/cli/dzarq.json"

aws cloudformation update-stack --stack-name "dzarq-improvements" --template-url "https://s3-eu-west-1.amazonaws.com/dzarq/cli/dzarq.json"

aws cloudformation delete-stack --stack-name "dzarq-improvements"

aws cloudformation create-stack --stack-name "dzarq-improvements" 
  --template-body file://dzarq.json 
  --parameters ParameterKey=Prefix,ParameterValue=dz,UsePreviousValue=false,ResolvedValue=dz

```

AWSCloudFormationFull



Parameters:
Values for Tags
VPC & SUbnet CIDRs

```
my sql root password at ec2 instance 'bobcIt0'

mysql -u root -p
CREATE USER 'arnoldo'@'localhost' IDENTIFIED BY 'rab4nItos';
CREATE DATABASE `db363458885`;
GRANT ALL PRIVILEGES ON `db363458885`.* TO "arnoldo"@"localhost";
FLUSH PRIVILEGES;

aws s3 cp s3://dzarq/dzarq.mysql.zip dzarq.mysql.zip

mysql -h [hostname] -u [uname] -p[pass] [db_to_restore] < [backupfile.sql]

mysql -h localhost -u arnoldo -p db363458885 < 1and1.arquitecta.db363458885.sql

```

IMPORTANT TASKS:
- Install again MySql in dzarq EC2 instance
- Connect with localhost again. But will be easy change connection between localhost and RDS
- Create the BBDD con template
- In separate file restore from backup to RDS (bat/sh file)
- Connect to new RDS
- Create a EC2 Template at the end
- In bat/sh file with ddbb restore add restore wordpress file to EC2

OJO
Al crear server.json hay que asociarle el rds-SG creado en el template del rds
aws cloudformation validate-template
[JSONLint] (http://jsonlint.com)

https://github.com/widdix/aws-cf-templates/tree/v2.0.1/wordpress  
http://templates.cloudonaut.io/en/latest/  
https://wordpress.org/plugins/tags/s3/  
https://cloudonaut.io/wordpress-on-aws-you-are-holding-it-wrong/  
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/php-hawordpress-tutorial.html  

```json
"HardDisk" : {
  "Type":"AWS::EC2::Volume",
  "DeletionPolicy" : "Delete",
  "Properties" : {
	"AutoEnableIO" : "false",
	"AvailabilityZone" : {"Ref": "AZone"},
	"Encrypted" : "false",
	"Size" : "8",
	"SnapshotId" : "snap-01ae5a2ddfd114ed5",
	"VolumeType" : "gp2",
	"Tags": [{"Key": "Name","Value": {"Fn::Join": ["-", [{"Ref": "Prefix"}, "volume"]]}},
			 {"Key": "Application","Value": {"Ref": "AWS::StackName"}},
			 {"Key": "Project","Value": {"Ref": "ProjectName"}}]		
  }
},


```
