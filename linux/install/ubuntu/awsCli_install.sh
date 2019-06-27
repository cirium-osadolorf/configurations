#! /bin/bash

: ${1?"USAGE: $1 USER" } 

apt-get update
apt-get -y install python-pip
pip install --upgrade pip
pip install awscli
pip install awscli --upgrade
echo " ============================================== "
echo "example configuration"
echo" AWS Access Key ID : [****************M5YB]"
echo "AWS Secret Access Key : [****************I5C1]"
echo "Default region name  : [eu-central-1]"
echo "Default output format : [json or text]"  
echo " ============================================== "
aws configure --profile $USER
aws --version

echo "To set default user use: "
echo "export AWS_DEFAULT_PROFILE=USER "


#https://computingforgeeks.com/how-to-install-and-use-aws-cli-on-linux-ubuntu-debian-centos/
