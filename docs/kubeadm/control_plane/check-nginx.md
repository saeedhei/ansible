# ۱. Pod ساده nginx
kubectl run nginx8080 --image=nginx --restart=Never --port=8080

# ۲. Service بساز (ClusterIP پیش‌فرض)
kubectl expose pod nginx8080 \
  --name=nginx8080-service \
  --port=8080 \
  --target-port=8080


kubectl run busybox --image=busybox --rm -it -- /bin/sh

# ۳. حالا تست کن - a این باید صفحه nginx رو برگردونه
wget -qO- --timeout=5 nginx8080-service:8080

# یا کامل‌تر
wget -qO- http://nginx8080-service:8080

# Delete after test
kubectl delete pod nginx8080 --force --grace-period=0
kubectl delete svc nginx8080-service
kubectl delete pod busybox --force --grace-period=0   

# Debug
kubectl get pods nginx8080 -o wide
kubectl describe pod nginx8080
# اگر subsets خالی باشه یا addresses نداشته باشه → سرویس هیچ endpointی نداره → connection refused طبیعی است.
kubectl get endpoints nginx8080-service -o yaml