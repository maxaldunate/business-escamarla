@echo off

aws cloudformation create-stack^
  --stack-name "dz-rds"^
  --template-body file://ddbb.json^
  --parameters ParameterKey="ProjectName",ParameterValue="dzarq"^
               ParameterKey="Prefix",ParameterValue="dz"^
			   ParameterKey="VpcId",ParameterValue="vpc-acd233ca"^
			   ParameterKey="RdsAccessSecurityGroup",ParameterValue="sg-e188a59a"^
			   ParameterKey="SubnetsIds",ParameterValue="subnet-18612943\,subnet-e9bfb38e\,subnet-2bc7d762"^
			   ParameterKey="AZone",ParameterValue="eu-west-1a"^
			   ParameterKey="DBName",ParameterValue="db363458885"^
			   ParameterKey="DBUser",ParameterValue="arnoldo"^
			   ParameterKey="DBPassword",ParameterValue="rab4nItos"

echo "Don't forget to remove the snapshot"
