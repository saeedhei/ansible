# روی control-plane (k8s-cp-1)
kubectl -n kube-system exec -it cilium-xws4q -- cilium status
# ببین health endpoint برای worker ساخته شده؟
kubectl -n kube-system exec cilium-xws4q -- cilium-dbg status --verbose > /tmp/cilium-cp-status.txt 2>&1
cat /tmp/cilium-cp-status.txt | grep -A 50 "Cluster health"
cat /tmp/cilium-cp-status.txt | grep -A 20 "Modules Health"

   

# یا دقیق‌تر
kubectl -n kube-system exec -it cilium-xws4q -- cilium-dbg status --verbose | grep -A 10 "Cluster health"

# روی worker node (k8s-worker-1) وارد شوید
ip link show cilium_host          # باید وجود داشته باشد
ip addr show cilium_host          # IP health چیه؟ معمولاً 10.244.0.x یا مشابه
cilium-dbg status                 # از داخل cilium pod روی worker اجرا کنید (اگر cilium-cli دارید)

# هر دو نود
sudo iptables -L FORWARD -v -n
sudo iptables -t nat -L POSTROUTING -v -n    # masquerade باید باشد

sudo sysctl net.ipv4.ip_forward               # باید 1 باشد
sudo sysctl net.ipv4.conf.all.rp_filter       # معمولاً 0 یا 2 توصیه می‌شود برای Cilium
sudo sysctl net.ipv4.conf.all.forwarding      # 1

ip neigh show | grep 45.88.188.201            # روی cp-1 → باید MAC داشته باشد
ip neigh show | grep 89.117.54.249            # روی worker-1



cilium-dbg status
cilium-dbg endpoint list
cilium-dbg health