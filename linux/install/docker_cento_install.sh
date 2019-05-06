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

systemctl start docker
systemctl enable docker
groupadd docker
usermod -aG docker $USERNAME

if systemctl status jenkins  2>> /dev/null; then
  usermod -aG docker jenkins
  echo "========= Jenkins Has Been Added to Docker Group ================"
else
  echo "========= Jenkins is not Installed in This Machine !!================"
fi

systemctl restart docker
systemctl status docker
docker run hello-world

# Script - stop
#sudo chmod 766 configurations/linux/install/docker_cento_install.sh && sudo configurations/linux/install/docker_cento_install.sh $USER
