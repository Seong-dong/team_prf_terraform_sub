#!/bin/bash
(
echo "P@ssw0rd"
echo "Pssw0rd"
) | passwd --stdin root
sed -i "s/^PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sed -i "s/^#PermitRootLogin yes/PermitRootLogin yes/g" /etc/ssh/sshd_config
service sshd restart
hostname web1
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
yum install -y httpd lynx
systemctl start httpd && systemctl enable httpd
wget -P /var/www/html/ https://github.com/Seong-dong/team_prj_django/blob/main/single_pages/static/single_pages/images/cafe.jpg?raw=true
mv cafe.jpg\?raw\=true test.jpg
echo "<h1>cloudNet@ CloudFront TEstls</h1><img width="400px" src='test.jpg'>" > /var/www/html/index.html