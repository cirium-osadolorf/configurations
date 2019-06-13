#! /bin/bash

curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

#sudo chmod 766 configurations/linux/install/ubuntu/dockercompose_install.sh && sudo configurations/linux/install/ubuntu/dockercompose_install.sh
