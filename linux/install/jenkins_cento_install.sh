#! /bin/bash
# script explanation is in the folloeing link :
# https://linuxize.com/post/how-to-install-jenkins-on-centos-7/
yum install -y java-1.8.0-openjdk-devel
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | tee /etc/yum.repos.d/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum -y install jenkins
systemctl start jenkins
systemctl status jenkins
systemctl enable jenkins

if systemctl status docker  2>> /dev/null; then
  usermod -aG docker jenkins
  echo "========= Jenkins Has Been Added to the Docker Group ================"
else
  echo "========= Docker is not Installed on This Machine !!================"
fi
echo ""

echo "=================================================="
echo "Input the below command to obtain you Jenkins Password : "
echo "cat /var/lib/jenkins/secrets/initialAdminPassword"
#sudo chmod 766 configurations/linux/install/jenkins_cento_install.sh &&  sudo configurations/linux/install/jenkins_cento_install.sh
