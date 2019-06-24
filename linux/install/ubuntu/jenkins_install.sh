#! /bin/bash

apt update -y
if java -version  2>> /dev/null; then
        echo "Java is installed on this machine"
else
        echo "installing Java"
        apt install -y openjdk-8-jdk
fi

#Jenkins Install
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt update -y
apt install -y jenkins
systemctl start jenkins
systemctl enable jenkins

echo ""
echo " Use the command  below to obtain your Jenkins Password : "
echo "=================================================="
echo "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
echo "=================================================="

#sudo chmod 766 configurations/linux/install/ubuntu/jenkins_install.sh && sudo configurations/linux/install/ubuntu/jenkins_install.sh
