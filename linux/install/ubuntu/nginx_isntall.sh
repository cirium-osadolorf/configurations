#!  /bin/bash

CODENAME=`lsb_release --codename | cut -f2`


curl -o nginx_signing.key http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key
#rm -rf nginx_signing.key

echo " "
echo "## Add official NGINX repository" >> /etc/apt/sources.list
echo "deb http://nginx.org/packages/ubuntu/ $CODENAME nginx" >> /etc/apt/sources.list
echo "deb-src http://nginx.org/packages/ubuntu/ $CODENAME nginx" >>  /etc/apt/sources.list

apt-get update -y
apt-get install -y nginx

systemctl start nginx
systemctl enable nginx
systemctl status nginx

#sudo chmod 766 configurations/linux/install/ubuntu/nginx_isntall.sh && sudo configurations/linux/install/ubuntu/nginx_isntall.sh
