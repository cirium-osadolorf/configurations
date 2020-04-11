#! /bin/bash
export VER="1.5.5" && wget https://releases.hashicorp.com/packer/${VER}/packer_${VER}_linux_amd64.zip 
unzip packer_${VER}_linux_amd64.zip
sudo mv packer /usr/local/bin
