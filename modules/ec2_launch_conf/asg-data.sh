#!/bin/bash
(
echo "p@ssw0rd"
echo "p@ssw0rd"
) | passwd --stdin root
sed -i "s/^PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sed -i "s/^#PermitRootLogin yes/PermitRootLogin yes/g" /etc/ssh/sshd_config
service sshd restart
hostname asg-prod-update
amazon-linux-extras install docker -y
systemctl enable --now docker
usermod -a -G docker ec2-user
chkconfig docker on
curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
yum install git -y
git clone https://github.com/Seong-dong/pp.git /home/ec2-user/pp
chmod 744 /home/ec2-user/pp/docker-compose.yml
cd /home/ec2-user/pp
docker-compose up --build -d