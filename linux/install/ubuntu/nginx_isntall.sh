#!  /bin/bash

apt-get update -y
apt-get install -y nginx
systemctl enable nginx

#sudo chmod 766 configurations/linux/install/ubuntu/nginx_isntall.sh && sudo configurations/linux/install/ubuntu/nginx_isntall.sh
