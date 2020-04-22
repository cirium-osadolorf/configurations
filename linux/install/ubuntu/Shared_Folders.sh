#! /bin/bash 

sudo apt-get install module-assistant
sudo m-a prepare
cd /media/yourusername
sudo sh VBoxLinuxAdditions.run
sudo adduser $USER vboxsf
