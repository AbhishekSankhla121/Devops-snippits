sudo kubeadm reset –f 

sudo rm -rf /etc/cni/net.d 

sudo rm -rf /var/lib/cni/ 

sudo rm -rf /var/lib/kubelet/* 

sudo rm -rf /etc/kubernetes/ 

sudo rm -rf /var/run/kubernetes 

sudo rm -rf /var/run/dockershim 

sudo rm -rf /var/lib/etcd 

sudo rm -rf /var/lib/calico 

rm -rf ~/.kube 

sudo systemctl restart kubelet 

sudo apt-get update  

sudo swapoff -a 
