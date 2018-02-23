@echo off

aws cloudformation create-stack^
  --stack-name "dz-network"^
  --template-body file://dz-network.json^
  --parameters ParameterKey="ProjectName",ParameterValue="dzarq"^
               ParameterKey="Prefix",ParameterValue="dz"^
			   ParameterKey="VpcCidr",ParameterValue="10.0.0.0/16"^
               ParameterKey="SubnetCidrA",ParameterValue="10.0.0.0/24"^
			   ParameterKey="SubnetCidrB",ParameterValue="10.0.1.0/24"^
			   ParameterKey="SubnetCidrC",ParameterValue="10.0.2.0/24"