kubectl -n kube-system rollout restart ds/cilium


kubectl -n kube-system logs cilium-rghs2 | grep -i regeneration -A 10

