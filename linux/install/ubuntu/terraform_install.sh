! /bin/bash

export VER="0.12.29"
curl https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip --output terraform_${VER}_linux_amd64.zip
apt-get install -y unzip
unzip terraform_${VER}_linux_amd64.zip
mkdir /bin/terraform
mv terraform /usr/local/bin/
rm -fR terraform_${VER}_linux_amd64.zip
terraform -version

#sudo chmod 766 configurations/linux/install/ubuntu/terraform_install.sh && sudo configurations/linux/install/ubuntu/terraform_install.sh
