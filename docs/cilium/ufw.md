grep DEFAULT_FORWARD_POLICY /etc/default/ufw

# ACCEPT
sudo sed -i 's/DEFAULT_FORWARD_POLICY="DROP"/DEFAULT_FORWARD_POLICY="ACCEPT"/' /etc/default/ufw
sudo ufw reload

# DROP
sudo sed -i 's/DEFAULT_FORWARD_POLICY="ACCEPT"/DEFAULT_FORWARD_POLICY="DROP"/' /etc/default/ufw
sudo ufw reload

kubectl -n kube-system delete pod -l k8s-app=cilium --grace-period=0 --force

kubectl -n kube-system get pods -l k8s-app=cilium -o wide

kubectl -n kube-system exec cilium-dk5tp -- cilium status
cilium-rc6b9

