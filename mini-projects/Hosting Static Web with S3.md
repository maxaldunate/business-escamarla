Mini-Project  
## Hosting Static Web with Amazon S3

### escamarla.org

#### Tags
project: escamarla-org-static

#### Bucket 1
name: escamarla.org
arn:aws:s3:::escamarla.org
Endpoint: http://escamarla.org.s3-website-eu-west-1.amazonaws.com
browser url: escamarla.org.s3-website-eu-west-1.amazonaws.com

#### Bucket 2
name: www.escamarla.org
arn:aws:s3:::www.escamarla.org
Endpoint:  redirection (same escamarla.org endpoint)
browser url: http://www.escamarla.org.s3-website-eu-west-1.amazonaws.com

#### Backuet Policy
```
{
  "Version":"2012-10-17",
  "Statement":[{
	"Sid":"PublicReadGetObject",
        "Effect":"Allow",
	  "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::escamarla.org/*"
      ]
    }
  ]
}
```

**Name Servers for HZ**  
ns-1269.awsdns-30.org.  
ns-1702.awsdns-20.co.uk.  
ns-559.awsdns-05.net.  
ns-461.awsdns-57.com.  
