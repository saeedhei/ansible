kubectl -n kube-system get pods -l k8s-app=cilium -o wide
kubectl -n kube-system logs -l k8s-app=cilium

kubectl -n kube-system exec -it cilium-hgb4b -- cilium status
