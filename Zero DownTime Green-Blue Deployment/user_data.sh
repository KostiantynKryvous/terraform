#!/bin/bash
yum -y update
yum -y install httpd


myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`

cat <<EOF > /var/www/html/index.html
<html>
<h2>Terraform</h2><br><p>
Server PrivateIP: $myip<br><br>
</html>
EOF

sudo service httpd start
chkconfig httpd on