#! /bin/bash
#Script that installs essental server packages for development 

#Java install
sudo yum install java-1.8.0-openjdk-devel

#Maven install
yum install maven
mvn ––version

#isntall git
sudo yum install -y git

#extras tools
yum install -y tree
