# timeout reached waiting for deployment cilium-test-1/echo-same-node to become ready (last error: only 0 of 1 replicas are available)
kubectl get ns | grep cilium-test

kubectl get pods -n cilium-test -o wide
kubectl get deployments -n cilium-test

kubectl delete ns cilium-test cilium-test-1 cilium-test-ccnp1 cilium-test-ccnp2 --force --grace-period=0
cilium connectivity test --single-node
kubectl get pods -A -w | grep cilium-test
