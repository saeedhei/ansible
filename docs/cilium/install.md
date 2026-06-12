helm install cilium oci://quay.io/cilium/charts/cilium \
  --version 1.19.0 \
  --namespace kube-system \
  --create-namespace



# cilium hubble enable
# cilium hubble disable

helm upgrade cilium oci://quay.io/cilium/charts/cilium --version 1.19.0 \
   --namespace kube-system \
   --reuse-values \
   --set hubble.relay.enabled=true