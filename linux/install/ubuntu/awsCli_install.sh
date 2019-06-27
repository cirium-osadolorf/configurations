#! /bin/bash

apt install awscli
aws --version
echo "example configuration"
echo" AWS Access Key ID : [****************M5YB]"
echo "AWS Secret Access Key : [****************I5C1]"
echo "Default region name  : [eu-central-1]"
echo "Default output format : [json or text]"  
aws configure
aws --version
