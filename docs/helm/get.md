helm get values cilium -n kube-system
# result
USER-SUPPLIED VALUES:
hubble:
  enabled: true
  relay:
    enabled: true
  ui:
    enabled: true
ipam:
  mode: kubernetes
kubeProxyReplacement: true
rollOutCiliumPods: true
