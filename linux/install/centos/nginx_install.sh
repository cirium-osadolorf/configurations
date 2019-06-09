#! /bin/bash

yum install  -y epel-release
yum install -y  nginx
systemctl start nginx
systemctl enable nginx

# alternative method of installing nginx 
# touch /etc/yum.repos.d/nginx.repo
# cat << EOF > /etc/yum.repos.d/nginx.repo
#[nginx]
#name=nginx repo
#baseurl=http://nginx.org/packages/centos/7/$basearch/
#gpgcheck=0
#enabled=1
# EOF
# yum update -y
# yum install -y nginx
# systemctl start nginx
# systemctl enable nginx
# systemctl status nginx

#sudo chmod 766 configurations/linux/install/centos/nginx_install.sh && sudo configurations/linux/install/centos/nginx_install.sh
