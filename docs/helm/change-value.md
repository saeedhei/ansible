helm upgrade cilium cilium/cilium \
  -n kube-system \
  --reuse-values \
  --set kubeProxyReplacement=false