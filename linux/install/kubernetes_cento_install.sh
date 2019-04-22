#! /bin/bash
yum remove docker \
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
    
yum install docker-ce-docker-ce-18.06.1.ce-3.el7
yum update --exclude=docker

#sudo chmod 766 configurations/linux/install/kubernetes_cento_install.sh &&  sudo configurations/linux/install/kubernetes_cento_install.sh
