# حذف pod Cilium روی worker
kubectl -n kube-system delete pod cilium-wwkr5 

# حذف pod Cilium روی master
kubectl -n kube-system delete pod cilium-hgb4b

kubectl -n kube-system exec -it cilium-hgb4b -- cilium status
