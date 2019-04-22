#! /bin/bash
# Link for the  full instructions https://docs.docker.com/install/linux/docker-ce/centos/
sudo yum remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2


sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install -y docker-ce docker-ce-cli containerd.io

sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl restart docker
sudo systemctl status docker
sudo docker run hello-world
#sudo chmod 766 configurations/linux/install/docker_cento_install.sh &&  sudo configurations/linux/install/docker_cento_install.sh
