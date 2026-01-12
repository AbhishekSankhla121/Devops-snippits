kubectl get node 

kubectl config view 

kubectl get pods 

kubectl get events 

kubectl delete all --all 

kubectl delete pods --all 

kubectl delete svc --all 

kubectl delete deployment --all 

kubectl delete configmap --all 

kubectl delete secret --al 

kubectl apply -f one.yml 

kubectl describe pod mongodb-deployment-644cd66579-cmkz7 

kubectl config use-context rancher-desktop 

 kubectl config get-contexts 

 kubectl config current-context 

 kubectl get pods --all-namespaces 

kubectl get namespaces 

 kubectl explain pods 

kubectl edit pod nginx-mischa 

kubectl get pod nginx-mischa -o yaml 

kubectl exec -it nginx-mischa -- /bin/bash 

kubectl exec -h | less 

kubectl get pods -o wide 

kubectl create deploy -h 

kubectl create deploy test --image=httpd --replicas=3 

kubectl create deploy -h | vim - 

watch -n 1 "kubectl get pods" 

kubectl get namespaces 

 kubectl create namespace abhishek --dry-run=client -o yaml 

 kubectl run abhishek-nginx --image=nginx --namespace abhishek 

kubectl config set-context --current --namespace=abhishhek 

 kubectl port-forward pods/mealie-74495f8c7f-z4qpq 9000 

 kubectl config view --minify | findstr namespace 

 kubectl get pods -o wide -A 

kubectl expose deployment mealie --port 8080 (not recommeded for production) 

Kubectl get sevice 

 kubectl get nodes 

 kubectl get nodes -o wide 

kubectl get all -A -o wide 

kubectl get all -A  

kubectl get persistentvolumeclaims --namespace=mealie 

 kubectl get persistentvolume 

 kubectl get storageclasses 

 kubectl get storageclasses.storage.k8s.io 

kubectl get configmap -n dashtera 

kubectl create secret docker-registry regcred --docker-server=cleo.lightningchart.com:5050 --docker-username=gitlab+deploy-token-demo-1 --docker-password=gld 

kubectl get secret 

kubectl config view –minify 

kubectl -n kube-system describe deployment metrics-server 

kubectl get vpa 

kubectl top node 

// this command will help to create a token so other worker node can join the cluster  

kubeadm token create --print-join-command 