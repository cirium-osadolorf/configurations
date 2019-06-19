! /bin/bash

curl https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip --output terraform_0.11.8_linux_amd64.zip
apt-get install -y unzip
unzip terraform_0.11.8_linux_amd64.zip
mkdir /bin/terraform
mv terraform /usr/local/bin/
rm -fR terraform_0.11.8_linux_amd64.zip
terraform -version
#sudo chmod 766 configurations/linux/install/ubuntu/terraform_install.sh && sudo configurations/linux/install/ubuntu/terraform_install.sh
