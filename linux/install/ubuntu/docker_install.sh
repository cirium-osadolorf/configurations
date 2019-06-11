#! /bin/bash
: ${1?"USAGE: $1 USERNAME "}

# Global variables
USERNAME=$1

#Install required packages:
apt-get update -y
apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

#Add the Docker GPG key and repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#Install Docker CE packages:
apt-get update -y 
apt-get install -y  docker-ce docker-ce-cli containerd.io

#Give cloud_user permission to run docker commands:
usermod -a -G docker $USERNAME

#Enbale the Service
systemctl start docker
systemctl enable docker
systemctl status docker
echo " "
echo " ==== Reboot the system ===="

#sudo chmod 766 configurations/linux/install/ubuntu/docker_install.sh && sudo configurations/linux/install/ubuntu/docker_install.sh $USER
