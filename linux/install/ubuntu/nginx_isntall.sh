#!  /bin/bash
apt-get update -y
apt-get install -y nginx
systemctl start nginx
systemctl enable nginx

rm -f  nginx_signing.key

#sudo chmod 766 configurations/linux/install/ubuntu/nginx_isntall.sh && sudo configurations/linux/install/ubuntu/nginx_isntall.sh

