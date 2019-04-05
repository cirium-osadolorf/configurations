sudo yum -y install docker
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl restart docker

#sudo usermod -aG docker jenkins
#sudo systemctl restart jenkins
