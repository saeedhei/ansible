sudo grep -A 5 SystemdCgroup /etc/containerd/config.toml

# Result
[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
  SystemdCgroup = true