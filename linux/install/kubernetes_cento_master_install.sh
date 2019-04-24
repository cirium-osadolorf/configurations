#! /bin/bash
#Kubernetes setup with kubeadm, kubectl adn kubelet

#Remove docker dependencies 
yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
                  
                  
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2                  
                  
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
    
#installing docker 
yum install -y docker-ce-18.06.1.ce-3.el7 

#Prevents docker from ever updating
yum -y install yum-versionlock
yum versionlock add docker-ce
yum versionlock list
yum list updates | cat -n


#Starting docker
systemctl start docker
systemctl enable docker
systemctl status docker
docker run hello-world

#Kubernetes setup
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kube*
EOF

# Set SELinux in permissive mode (effectively disabling it)
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

#install kubeadm , kubectl and kubelet
yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
systemctl enable --now kubelet
kubeadm version

#Bootstrap the cluster
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


#Flannel setup (Networking)
echo "net.bridge.bridge-nf-call-iptables=1" | tee -a /etc/sysctl.conf
sysctl -p
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml
echo "============================================"
echo"Verifying that all the nodes now have a STATUS of Ready:"
kubectl get nodes
echo "============================================"
echo"Verifying that all the fannel pods are Ready:"
kubectl get pods -n kube-system 

#sudo chmod 766 configurations/linux/install/kubernetes_cento_master_install.sh &&  sudo configurations/linux/install/kubernetes_cento_master_install.sh && mkdir -p $HOME/.kube && sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && sudo chown $(id -u):$(id -g) $HOME/.kube/config
