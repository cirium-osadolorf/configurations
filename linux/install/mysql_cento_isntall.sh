sudo yum localinstall https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm
sudo yum install mysql-community-server
sudo yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum update
sudo yum install mysql-community-server
sudo systemctl start mysqld
sudo systemctl enable mysqld
sudo systemctl status sysmysqld

# For security Configuration check the following resources:
# https://linuxize.com/post/install-mysql-on-centos-7/