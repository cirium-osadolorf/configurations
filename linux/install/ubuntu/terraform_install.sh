! /bin/bash

export VER="0.12.29"
apt-get install -y curl
apt-get install -y unzip
curl https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip --output terraform_${VER}_linux_amd64.zip
unzip terraform_${VER}_linux_amd64.zip
mv terraform /usr/local/bin/
rm -rf terraform_${VER}_linux_amd64.zip
terraform -version

#sudo chmod 766 configurations/linux/install/ubuntu/terraform_install.sh && sudo configurations/linux/install/ubuntu/terraform_install.sh
