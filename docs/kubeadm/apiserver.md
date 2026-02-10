# 1
sudo grep -A 5 SystemdCgroup /etc/containerd/config.toml
# Result
[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
  SystemdCgroup = true

# 2
sudo crictl ps -a | grep -E 'apiserver|etcd|controller-manager|scheduler'
# Result
ef13e9ebb80bf       550794e3b12ac       18 seconds ago       Running             kube-scheduler            1560                3ef42deeda258       kube-scheduler-k8s-cp-1            kube-system

f29af3c707a07       2c9a4b058bd7e       37 seconds ago       Running             kube-controller-manager   1552                d0ff14c193bb7       kube-controller-manager-k8s-cp-1   kube-system

f7382108d13ca       5c6acd67e9cd1       37 seconds ago       Running             kube-apiserver            1518                27d08b7aea3ba       kube-apiserver-k8s-cp-1            kube-system

81d66df4590d0       550794e3b12ac       37 seconds ago       Exited              kube-scheduler            1559                2fe524714ce29       kube-scheduler-k8s-cp-1            kube-system

711f0df662d05       0a108f7189562       37 seconds ago       Running             etcd                      1596                d50e1d43c513c       etcd-k8s-cp-1                      kube-system

04324a9d1b5d5       2c9a4b058bd7e       About a minute ago   Exited              kube-controller-manager   1551                4ca4c7627714e       kube-controller-manager-k8s-cp-1   kube-system

c876e86370f49       0a108f7189562       2 minutes ago        Exited              etcd                      1595                a06de95367a5a       etcd-k8s-cp-1                      kube-system

3c3b63a4c935c       5c6acd67e9cd1       3 minutes ago        Exited              kube-apiserver            1517                27d08b7aea3ba       kube-apiserver-k8s-cp-1            kube-system

# 3
sudo ss -tuln | grep 6443
# Result
tcp   LISTEN 0      4096               *:6443             *:*

# 4
 curl -k https://localhost:6443/version
# Result
{
  "major": "1",
  "minor": "35",
  "emulationMajor": "1",
  "emulationMinor": "35",
  "minCompatibilityMajor": "1",
  "minCompatibilityMinor": "34",
  "gitVersion": "v1.35.0",
  "gitCommit": "66452049f3d692768c39c797b21b793dce80314e",
  "gitTreeState": "clean",
  "buildDate": "2025-12-17T12:32:07Z",
  "goVersion": "go1.25.5",
  "compiler": "gc",
  "platform": "linux/amd64"

# 5
sudo journalctl -u kubelet -n 100 --no-pager | tail -30