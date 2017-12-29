@echo off

aws cloudformation create-stack^
  --stack-name "dz-rds"^
  --template-body file://dz-ddbb.json^
  --parameters ParameterKey="ProjectName",ParameterValue="dzarq"^
               ParameterKey="Prefix",ParameterValue="dz"^
			   ParameterKey="VpcId",ParameterValue="vpc-e34baa85"^
			   ParameterKey="RdsAccessSecurityGroup",ParameterValue="sg-c793bfbc"^
			   ParameterKey="SubnetsIds",ParameterValue="subnet-86c68edd\,subnet-dc101fbb\,subnet-55a1b11c"^
			   ParameterKey="AZone",ParameterValue="eu-west-1a"^
			   ParameterKey="DBName",ParameterValue="db363458885"^
			   ParameterKey="DBUser",ParameterValue="arnoldo"^
			   ParameterKey="DBPassword",ParameterValue="rab4nItos"

echo "Don't forget to remove the snapshot"
