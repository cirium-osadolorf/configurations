#! /bin/bash

#Java install
add-apt-repository ppa:webupd8team/java -y
apt-get update
apt install oracle-java8-installer
apt install oracle-java8-set-default


#Maven install
cd /opt/
wget http://www-eu.apache.org/dist/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz
tar -xf apache-maven-3.5.3-bin.tar.gz
mv apache-maven-3.5.3/ apache-maven/
update-alternatives --install /usr/bin/mvn maven /opt/apache-maven/bin/mvn 1001
mvn --version

echo "# Apache Maven Environment Variables" >> maven.sh 
echo "# MAVEN_HOME for Maven 1 - M2_HOME for Maven 2" >> maven.sh 
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> maven.sh
echo "export M2_HOME=/opt/apache-maven" >> maven.sh
echo "export MAVEN_HOME=/opt/apache-maven" >> maven.sh
echo "export PATH=${M2_HOME}/bin:${PATH}" >> maven.sh
cd


#extras tools
apt-get install -y tree
apt-get install -y dialog
apt-get install -y dos2unix  

#sudo chmod 766 configurations/linux/install/ubuntu/essentials_install.sh && sudo configurations/linux/install/ubuntu/essentials_install.sh

