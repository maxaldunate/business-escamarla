@echo off

aws cloudformation create-stack^
  --stack-name "dz-rds"^
  --template-body file://ddbb.json^
  --parameters ParameterKey="ProjectName",ParameterValue="dzarq"^
               ParameterKey="Prefix",ParameterValue="dz"^
			   ParameterKey="AZone",ParameterValue="eu-west-1a"^
			   ParameterKey="DBName",ParameterValue="db363458885"^
			   ParameterKey="DBUser",ParameterValue="arnoldo"^
			   ParameterKey="DBPassword",ParameterValue="rab4nItos"

echo "Don't forget to remove the snapshot"
