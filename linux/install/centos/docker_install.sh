#! /bin/bash
# Script that installs docker on cento machines
# Link for the  full instructions https://docs.docker.com/install/linux/docker-ce/centos/
: ${1?"USAGE: $1 USERNAME "}

# Global variables
USERNAME=$1

# Script Start
yum remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io


groupadd docker
usermod -aG docker $USERNAME

systemctl start docker
systemctl enable docker
systemctl status docker

# Script - stop
#sudo chmod 766 configurations/linux/install/centos/docker_install.sh && sudo configurations/linux/install/centos/docker_install.sh $USER
