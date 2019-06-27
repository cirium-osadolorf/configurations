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


#Another method
#sudo apt-get install software-properties-common
#sudo apt-add-repository universe
#sudo apt-get update
#sudo apt-get install python-pip
#sudo apt-get install -y python-dev python-pip
#sudo pip install awscli
#aws --version
#aws configure
