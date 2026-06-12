helm uninstall cilium -n kube-system

kubectl delete crd $(kubectl get crds | grep cilium | awk '{print $1}')
kubectl get crds | grep cilium
kubectl get crds | grep cili

kubectl -n kube-system delete cm cilium-config --ignore-not-found
kubectl -n kube-system delete secret -l app.kubernetes.io/part-of=cilium --ignore-not-found

sudo rm -rf /sys/fs/bpf/*
sudo reboot