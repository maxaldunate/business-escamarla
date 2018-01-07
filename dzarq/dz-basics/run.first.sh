User Data
$ aws s3 cp s3://dzarq/cli/webserver/run.first.sh run.first.sh
$ chmod +x run.first.sh

#!/bin/bash
touch /var/www/html/try.html
echo '<!DOCTYPE html><html><head>' >> /var/www/html/try.html
echo '<title>Just to try connection</title></head>' >> /var/www/html/try.html
echo '<body>Just to try connection</body></html>' >> /var/www/html/try.html