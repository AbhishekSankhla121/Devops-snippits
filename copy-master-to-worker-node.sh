mkdir -p $HOME/.kube 
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config 
sudo chown $(id -u):$(id -g) $HOME/.kube/config 

sshpass -p "abhishek@1" scp -o StrictHostKeyChecking=no -r ~/.kube abhishek@k9s-worker1.abhishek.local:~/ 
sshpass -p "abhishek@1" scp -o StrictHostKeyChecking=no -r ~/.kube abhishek@k9s-worker.abhishek.local:~/ 
