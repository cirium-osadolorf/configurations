#! /bin/bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -


add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update -y

apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu kubelet=1.15.7-00 kubeadm=1.15.7-00 kubectl=1.15.7-00

apt-mark hold docker-ce kubelet kubeadm kubectl

# Install iptables, is essentail for intercluster communication
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p



echo 'add this node to the cluster'
echo 'example: '
echo 'kubeadm join 172.31.117.32:6443 --token 70qs3o.4glp89w7hsob511v --discovery-token-ca-cert-hash sha256:3a4c6d9cf4393fb583dd9f0ab09e2861ca94e51c537cc6d9fb4e318b6d7cc6d2'