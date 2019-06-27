#! /bin/bash 

apt-get install -y  software-properties-common
apt-add-repository universe
apt-get update -y
apt-get install -y  python-pip
pip install --upgrade pip
pip install awscli
pip install awscli --upgrade

echo "example configuration"
echo" AWS Access Key ID [****************M5YB]:"
echo "AWS Secret Access Key [****************I5C1]:"
echo "Default region name [eu-central-1]:"
echo "Default output format [json]:"
aws configure
aws --version
#
