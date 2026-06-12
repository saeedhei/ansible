kubectl -n kube-system get pods -l k8s-app=cilium -o wide
kubectl get pods -n kube-system -l k8s-app=cilium -o 
kubectl -n kube-system exec cilium-wtxq2 -- cilium status | grep "Cluster health"
kubectl -n kube-system exec cilium-wtxq2 -- cilium-dbg status --verbose | grep -A 30 "Cluster health"
