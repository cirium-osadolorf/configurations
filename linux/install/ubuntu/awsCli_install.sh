#! /bin/bash

#: ${1?"USAGE: $1 AWS_USER "}

sudo apt-get update
sudo apt-get -y install python-pip
sudo pip install --upgrade pip
sudo pip install awscli
sudo pip install awscli --upgrade
echo " ============================================== "
echo "example configuration"
echo" AWS Access Key ID : [****************M5YB]"
echo "AWS Secret Access Key : [****************I5C1]"
echo "Default region name  : [eu-central-1]"
echo "Default output format : [json or text]"  
echo " ============================================== "
aws configure
#aws configure --profile $AWS_USER
aws --version
sudo apt-get install -y python3-pip python3 python3-setuptools
pip3 install boto3 --user
echo "To set default user use: "
echo "export AWS_DEFAULT_PROFILE=USER "
#https://computingforgeeks.com/how-to-install-and-use-aws-cli-on-linux-ubuntu-debian-centos/
