# Project dzarquitectura.com
## ELB, CloudFront & SSL Certificates

### ELB
* EC2 service elb & target group in the same Region & AZ
* Target: the instance running wordpress (Elastic IP will not be neccessary)
* Load Balancer: same Security Group to WebServer
* Pick new DNS name

### SSL Certificate
* Create `dzarquitectura.com` email validation
* Create `*.dzarquitectura.com` email validation
* Take care secure elements on the web

### CloudFront Ditribution
* CNAMEs: www.dzarquitectura.com, dzarquitectura.com
* SSL Certificate: create dzarquitectura.com
* Origins: "the ELB" dzarq-elb-963932801.eu-west-1.elb.amazonaws.com

### Route 53

* Remove Elastic IP Address
* [Differences between the A, CNAME, ALIAS and URL records](https://support.dnsimple.com/articles/differences-between-a-cname-alias-url/)
* Recordsets for dzarquitectura.com
  - dzarquitectura.com --> A --> ALIAS d3ra9b0vsaout9.cloudfront.net
  - www.dzarquitectura.com --> CNAME --> dzarquitectura.com
  
