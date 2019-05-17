#! /bin/bash

yum install  -y epel-release
yum install -y  nginx
systemctl start nginx
systemctl enable nginx

#sudo chmod 766 configurations/linux/install/nginx_cento_install.sh && sudo configurations/linux/install/nginx_cento_install.sh
