@echo off

aws s3 cp dz.json           s3://dzarq/cli/dz/dz.json
aws s3 cp dz-ddbb.json      s3://dzarq/cli/dz/dz-ddbb.json
aws s3 cp dz-network.json   s3://dzarq/cli/dz/dz-network.json
aws s3 cp dz-servers.json   s3://dzarq/cli/dz/dz-servers.json
aws s3 cp run.first.sh      s3://dzarq/cli/dz/run.first.sh

aws cloudformation create-stack^
  --stack-name "dz"^
  --template-url "https://s3-eu-west-1.amazonaws.com/dzarq/cli/dz/dz.json"^
  --parameters ParameterKey="ProjectName",ParameterValue="dzarq"^
               ParameterKey="Prefix",ParameterValue="dz"^
               ParameterKey="Region",ParameterValue="Maxito"^
               ParameterKey="AZone",ParameterValue="eu-west-1a"^
               ParameterKey="VpcCidr",ParameterValue="10.0.0.0/16"^
               ParameterKey="SubnetCidrA",ParameterValue="10.0.0.0/24"^
               ParameterKey="SubnetCidrB",ParameterValue="10.0.1.0/24"^
               ParameterKey="SubnetCidrC",ParameterValue="10.0.2.0/24"^
               ParameterKey="DBName",ParameterValue="db363458885"^
               ParameterKey="DBUser",ParameterValue="arnoldo"^
               ParameterKey="DBPassword",ParameterValue="rab4nItos"^
               ParameterKey="KeyName",ParameterValue="kp-wordpress-instance"