#! /bin/bash
# script explanation is in the folloeing link :
# https://linuxize.com/post/how-to-install-jenkins-on-centos-7/
sudo yum install java-1.8.0-openjdk-devel
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum -y install jenkins
sudo systemctl start jenkins
systemctl status jenkins
sudo systemctl enable jenkins
cat /var/jenkins_home/secrets/initialAdminPassword
