#! /bin/bash

apt install awscli
aws --version
echo " ============================================== "
echo "example configuration"
echo" AWS Access Key ID : [****************M5YB]"
echo "AWS Secret Access Key : [****************I5C1]"
echo "Default region name  : [eu-central-1]"
echo "Default output format : [json or text]"  
echo " ============================================== "
aws configure
aws --version







#! /bin/bash
apt-get install -y software-properties-common
apt-add-repository universe
apt-get update -y
apt-get install -y python-pip
apt-get install -y python-dev python-pip
pip install awscli

echo " ============================================== "
echo "example configuration"
echo "AWS Access Key ID : [****************M5YB]"
echo "AWS Secret Access Key : [****************I5C1]"
echo "Default region name  : [eu-central-1]"
echo "Default output format : [json or text]"  
echo " ============================================== "

aws configure
aws --version

echo "To set default user use: "
echo "export AWS_DEFAULT_PROFILE=USER "
