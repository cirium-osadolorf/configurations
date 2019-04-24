#! /bin/bash

cd    
kubeadm init --pod-network-cidr=10.244.0.0/16 >> kubeadm_init    
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

kubectl version
echo "============================================"
tail -n 6 kubeadm_init
echo "============================================"

echo "have you joined your workder nodes to the cluster? (yes / no) "
read INPUT
kubectl get nodes

Flannel setup
echo "net.bridge.bridge-nf-call-iptables=1" | tee -a /etc/sysctl.conf
sysctl -p
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml
echo "============================================"
echo"Verifying that all the nodes now have a STATUS of Ready:"
kubectl get nodes
echo "============================================"
echo"Verifying that all the fannel pods are Ready:"
kubectl get pods -n kube-system 

#sudo chmod 766 configurations/linux/install/testMaster2.sh &&  configurations/linux/install/testMaster2.sh 
