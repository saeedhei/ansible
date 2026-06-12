kubectl -n kube-system get pods -l k8s-app=cilium

cilium status --wait

cilium connectivity test


kubectl -n kube-system get pods -l k8s-app=cilium -o wide
kubectl -n kube-system exec -it <cilium-pod-on-worker> -- cilium version
kubectl -n kube-system exec -it cilium-lnq9w -- cilium version

# node status
kubectl -n kube-system exec ds/cilium -- cilium-dbg status
kubectl -n kube-system exec -it $(kubectl get pod -n kube-system -l k8s-app=cilium -o name | grep cilium-nkdst) -- cilium-dbg status
# result
albert@k8s-cp-1:~$ kubectl -n kube-system exec ds/cilium -- cilium-dbg status
KVStore:                 Disabled
Kubernetes:              Ok         1.35 (v1.35.0) [linux/amd64]
Kubernetes APIs:         ["cilium/v2::CiliumCIDRGroup", "cilium/v2::CiliumClusterwideNetworkPolicy", "cilium/v2::CiliumEndpoint", "cilium/v2::CiliumNetworkPolicy", "cilium/v2::CiliumNode", "core/v1::Pods", "networking.k8s.io/v1::NetworkPolicy"]
KubeProxyReplacement:    False
Host firewall:           Disabled
SRv6:                    Disabled
CNI Chaining:            none
CNI Config file:         successfully wrote CNI configuration file to /host/etc/cni/net.d/05-cilium.conflist
Cilium:                  Ok   1.19.0 (v1.19.0-7c6667e1)
NodeMonitor:             Disabled
Cilium health daemon:    Ok
IPAM:                    IPv4: 3/254 allocated from 10.0.0.0/24,
IPv4 BIG TCP:            Disabled
IPv6 BIG TCP:            Disabled
BandwidthManager:        Disabled
Routing:                 Network: Tunnel [vxlan]   Host: Legacy
Attach Mode:             Legacy TC
Device Mode:             veth
Masquerading:            IPTables [IPv4: Enabled, IPv6: Disabled]
Controller Status:       20/20 healthy
Proxy Status:            OK, ip 10.0.0.111, 0 redirects active on ports 10000-20000, Envoy: external
Global Identity Range:   min 256, max 65535
Hubble:                  Disabled        Metrics: Disabled
Encryption:              Disabled
Cluster health:          2/2 reachable   (2026-02-12T23:43:38Z)   (Probe interval: 1m36.566274746s)
Name                     IP              Node                     Endpoints
Modules Health:          Stopped(23) Degraded(0) OK(72)

