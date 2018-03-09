# EIN. Escamarla Integration

## Software Components
* WebPage: Frontend with Angular 4.0
* Backend: API Gateway for WebPage
* API Gateway for Integration

## Integration Process

### Manual

* Data Configuration
  - Resource Name
    - Ex. "gpssignals". 
    - Validation rules like url. 
    - Caps insensitive
  - Frequency
    - for csv files generation (to S3) and send email notification
  - Logs Access
    - Logs will be available till next weekly bill period
  - S3 csv file TTL
    - Time that csv files will be available on S3


1. Generic API GatwWay
   * Defined Resources PUT method and ...
1. Lambda
   * Get API call and publish to DynamoDb
1. DynamoDb
   * PutItem with TTL functionality (frequency)
   * Remove fiished Items and generate csv to S3
1. S3
   * when receive the file sen and email
1. SES
   * Send notification


1. LogData from CloudWatch to S3





### Databases Costs
Peso de documentos mongo de ejemplo
* RCP Size Up4/4 * Raws/2
* WCP 1Kb * Raws * Size



