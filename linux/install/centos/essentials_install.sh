#! /bin/bash
#Script that installs essental server packages for development 
yum update -y

#Java install
yum install -y java-1.8.0-openjdk-devel

#Maven install
yum install maven -y
mvn ––version

#extras tools
yum install -y tree
yum install -y dialog
yum install -y dos2unix  
yum install -y dialog
yum install -y redhat-lsb-core



#sudo chmod 766 configurations/linux/install/centos/essentials_install.sh && sudo configurations/linux/install/centos/essentials_install.sh
