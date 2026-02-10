# kubectl get nodes -o wide
NAME       STATUS   ROLES           AGE    VERSION   INTERNAL-IP     EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION       CONTAINER-RUNTIME
k8s-cp-1   Ready    control-plane   6d1h   v1.35.0   89.117.54.249   <none>        Ubuntu 22.04.5 LTS   5.15.0-164-generic   containerd://1.7.28

kubectl get pods -n kube-system -o wide


kubectl port-forward -n kube-system svc/hubble-ui 8081:80