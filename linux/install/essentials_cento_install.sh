#! /bin/bash
#Script that installs essental server packages for development 

#Java install
sudo yum install -y java-1.8.0-openjdk-devel

#Maven install
yum install maven -y
mvn ––version

#extras tools
yum install -y tree

#sudo chmod 766 configurations/linux/install/essentials_cento_install.sh && sudo configurations/linux/install/essentials_cento_install.sh
