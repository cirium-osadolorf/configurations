#! /bin/bash

curl https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
--output terraform_0.11.8_linux_amd64.zip
unzip terraform_0.11.8_linux_amd64.zip
mkdir /bin/terraform 
mv terraform_0.11.8_linux_amd64 /bin/terraform
rm -fR terraform_0.11.8_linux_amd64.zip