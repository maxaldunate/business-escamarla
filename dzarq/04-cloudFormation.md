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

```

AWSCloudFormationFull



Parameters:
Values for Tags
VPC & SUbnet CIDRs





