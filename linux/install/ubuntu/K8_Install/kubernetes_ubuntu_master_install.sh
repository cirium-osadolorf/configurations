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

'''


# Initialize the cluster (run only on the master):
sudo  kubeadm init --pod-network-cidr=10.244.0.0/16

# Set up local kubeconfig (run only on the master):
mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Apply Flannel CNI network overlay:
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# Join the worker nodes to the cluster:

#Verify the worker nodes have joined the cluster successfully:
kubectl get nodes

'''
