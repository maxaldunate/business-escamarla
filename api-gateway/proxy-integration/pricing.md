# Costs by message for this integration solution 

> EU (Ireland) Region (eu-west-1)

## API-Gateway
* Usage: Access point and security
* [Aws link](https://aws.amazon.com/api-gateway/pricing/)
* API calls 3.5 per millon received
* Data Transfer Costs (just transfer out)
  * $0.09 /GB for the first 10 TB
  * $0.085/GB for the next  40 TB
  * $0.07 /GB for the next 100 TB
  * $0.05 /GB for the next 350 TB
* Caching. Optional. Size(GB) - Price per Hour
  * 0.5     $0.020
  * 1.6     $0.038
  * 6.1     $0.200
  * 13.5    $0.250
  * 28.4    $0.500
  * 58.2    $1.000
  * 118.0   $1.900
  * 237.0   $3.800

## Lambda
* Usage: request processor, mapping and insert
* [Aws link](https://aws.amazon.com/lambda/pricing/)
* Free tier, indefinitely. 1 millon requests, 400.000 GB/Seconds
* Thereafter
  * $0.20 per 1 millon requests ($0.0000002 per request)
  * $0.00001667 for every GB/second used

## CloudWatch
* Usage: invoicing, custom logs, execution lambda logs
* [Aws link](https://aws.amazon.com/cloudwatch/pricing/)
* Dashborads: $3.00 per dashboard per month
* Metrics
  * $0.30 per metric per month for the first 10,000 metrics
  * $0.10 per metric per month for the next 240,000 metrics
  * $0.05 per metric per month for the next 750,000 metrics
  * $0.02 per metric per month for metrics over 1,000,000
* Alarms
  * $0.10 per alarm per month
  * $0.30 per high-resolution alarm per month
* API Requests
  * $0.01 per 1,000 GetMetricStatistics, ListMetrics, PutMetricData, GetDashboard, ListDashboards, PutDashboard and DeleteDashboards requests
* Logs
  * $0.57 per GB ingested**
  * $0.03 per GB archived per month***
  * Data Transfer OUT from CloudWatch Logs is priced equivalent to the “Data Transfer OUT from Amazon EC2 To” and “Data Transfer OUT from Amazon EC2 to Internet” tables on the EC2 Pricing Page.[link](https://aws.amazon.com/ec2/pricing/on-demand/)
* Vended Logs
  * Vended logs are logs that are natively published by AWS services on behalf of the customer. VPC Flow logs is the first Vended log type that will benefit from this tiered model. However, more AWS Service log types will be added to Vended Log type in the future.
  * $0.57  per GB for the first 10TB of vended log data ingested
  * $0.285 per GB for the next  20TB of vended log data ingested
  * $0.114 per GB for the next  20TB of vended log data ingested
  * $0.057 per GB for vended log data ingested over 50TB
* Custom Events
  * $1.00 per million custom events generated
  * Each 64KB of payload (rounded up) is billed as one custom event. For example, a single custom event with with a 256KB payload will be billed as four custom events. A single custom event with a 65KB payload will be billed as two custom events.

## S3
* Usage: Logs, DataBackups
* [Aws link](https://aws.amazon.com/s3/pricing)
* Storage Pricing (standard)
  * First  50 TB / Month	$0.023 per GB
  * Next  450 TB / Month	$0.022 per GB
  * Over  500 TB / Month	$0.021 per GB
* Request Pricing
  * PUT, COPY, POST, or LIST Requests. 	 $0.005  per 1,000 requests
  * GET and all other Requests.            $0.0004 per 1,000 requests

## Glacier
* Usage: Logs, DataBackups
* [Aws link. Same as S3](https://aws.amazon.com/s3/pricing)
* Storage $0.0125 per GB
* Requests. $0.055 per 1,000 requests

## DynamoDB
* Usage: request mapped storage
* [Aws link](https://aws.amazon.com/dynamodb/pricing/)
* Free Tier
  - Free tier does not expire at the end of your 12 month
  - 200 million requests per month 
  - 25 WCU and 25 RCU
  - 25 GB of indexed data storage
* Provisioned Throughput (Write)
  - 1 WCU up to one write per second, enough for 2.5 million writes per month
  - $0.47 per WCU
* Provisioned Throughput (Read)
  - 1 RCU up to two reads per second, enough for 5.2 million reads per month
  - $0.47 per WCU
* Indexed Data Storage
  - DynamoDB charges an hourly rate per GB of disk space that your table consumes
  - $0.25 per GB
* Data Transfer
  - Data Transfer IN. $0.00 per GB
  - Data Transfer OUT (free 15 GB of data transfer out each month )
    * Up to 1 GB / Month $0.00 per GB
    * Next 9.999 TB / Month $0.09 per GB
    * Next 40 TB / Month  $0.085 per GB
    * Next 100 TB / Month $0.07 per GB
    * Greater than 150 TB / Month $0.05 per GB


## Aws Cognito
* Usage: Authentication
* [Aws link](https://aws.amazon.com/cognito/pricing/)
* MAU: Monthly Active Users
  - First            50,000      Free
  - Next             50,000  $0.00550 per MAU
  - Next            900,000  $0.00460 per MAU
  - Next          9,000,000  $0.00325 per MAU
  - Greater than 10,000,000  $0.00250 per MAU

## Amazon RDS for SQL Server Pricing
* Usage: Persistance
* [Aws link](https://aws.amazon.com/rds/sqlserver/pricing/)
* Epress
  - db.t2.micro   $0.023 per hour
  - db.t2.small   $0.046 per hour
  - db.t2.medium  $0.093 per hour
* Web 
  - Standard Instances - Current Generation
    * From   db.t2.small  $0.146 per hour
    * To   db.m3.2xlarge  $1.665 per hour
  - Memory Optimized Instances - Current Generation
    * From   db.r4.large  $0.465 per hour
    * To   db.r3.2xlarge  $1.83  per hour
* Standard
  - Standard Instances - Current Generation
    * From   db.m4.large  $0.996 per hour
    * To   db.m3.2xlarge  $2.675 per hour
  - Memory Optimized Instances - Current Generation
    * From   db.r4.large  $1.025 per hour
    * To   db.r3.8xlarge  $12.20 per hour
* Enterprise
  - Standard Instances - Current Generation
    * From  db.m4.xlarge  $2.363 per hour
    * To  db.m4.16xlarge $37.808 per hour
  - Memory Optimized Instances - Current Generation
    * From  db.r4.xlarge  $2.548 per hour
    * To  db.r3.8xlarge  $19.271 per hour


## Amazon RDS for MySQL Pricing
* Usage: Persistance
* [Aws link](https://aws.amazon.com/rds/mysql/pricing/)
* Multi-AZ Deployment
* On-Demand DB Instances
  * Standard Instances - Current Generation
    - From db.m3.medium  $0.19 per hour
    - To  db.t2.2xlarge $1.168 per hour
  * Memory Optimized Instances - Current Generation
    - From  db .r3.large  $0.53 per hour
    - To  db.r4.16xlarge $16.96 per hour
* Reserved Instances
  - From db.t2.micro  $0.0288 per hour
  - To  db.r3.8xlarge$6.199 per hour
* Database Storage
  - General Purpose (SSD) Storage $0.253 per GB-month
  - Magnetic Storage              $0.22  per GB-month
* Data Transfer
  - Data Transfer IN $0.00 per GB
  - Data Transfer OUT From Amazon RDS To Internet
    * Up to          1 GB / Month  $0.00  per GB
    * Next       9.999 TB / Month  $0.09  per GB
    * Next          40 TB / Month  $0.085 per GB
    * Next         100 TB / Month  $0.07  per GB
    * Greater than 150 TB / Month  $0.05  per GB


## Read Replicas ?