#!/bin/bash
yum update -y
amazon-linux-extras install docker
service docker start
systemctl enable docker
curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
systemctl restart docker
usermod -a -G docker ec2-user
(
echo "p@ssw0rd"
echo "p@ssw0rd"
) | passwd --stdin root
sed -i "s/^PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sed -i "s/^#PermitRootLogin yes/PermitRootLogin yes/g" /etc/ssh/sshd_config
service sshd restart
docker run --name web -dit -p 80:8000 seongdong/icurfer