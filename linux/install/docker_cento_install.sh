#! /bin/bash
# Link for the  full instructions https://docs.docker.com/install/linux/docker-ce/centos/
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
systemctl restart docker
systemctl status docker
docker run hello-world

#cd ~ && sudo chmod 766 configurations/linux/install/docker_cento_install.sh && cp configurations/linux/install/docker_cento_install.sh ~ ; ./docker_cento_install.sh && usermod -aG docker $USER
 
