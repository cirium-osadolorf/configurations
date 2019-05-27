#!  /bin/bash
apt-get update -y
apt-get upgrade -y

curl -o nginx_signing.key http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key


cat << EOF >> /etc/apt/sources.list
## Add official NGINX repository
deb http://nginx.org/packages/ubuntu/ xenial nginx
deb-src http://nginx.org/packages/ubuntu/ xenial nginx
EOF

systemctl stop apache2.service
systemctl disable apache2.service

apt-get update -y
apt-get install -y nginx
systemctl start nginx
systemctl enable nginx

rm -f  nginx_signing.key

#sudo chmod 766 configurations/linux/install/ubuntu/nginx_isntall.sh && sudo configurations/linux/install/ubuntu/nginx_isntall.sh

