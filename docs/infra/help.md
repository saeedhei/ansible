🐧 پیش‌نیازها (همه VPSها)

روی همه‌ی Ubuntuها:

Ubuntu 22.04 LTS

SSH key (نه پسورد)

Disable swap

UFW حداقلی

hostname درست

📌 این‌ها رو قدم صفر حساب کن.
--------------------------------
🧭 نقشه راه (کاملاً مرحله‌ای)
🔹 فاز 0 – پایه سیستم

Docker (یا containerd)

kernel modules

sysctl for Kubernetes

👉 هنوز Kubernetes نصب نمی‌کنی.
---------------------------------
🔹 فاز 1 – Kubernetes ساده و تمیز
انتخاب درست:

✅ kubeadm + containerd

چرا؟

استاندارد upstream

بدون lock-in

مناسب production واقعی

📌 خروجی:

cluster سالم

kubeconfig
----------------------------------
🔹 فاز 2 – شبکه (CNI)
پیشنهاد:

Cilium (آینده‌نگر)
یا

Calico (ساده‌تر)

Cilium + Envoy = ترکیب عالی برای آینده.
-------------------------------------------
🔹 فاز 3 – Load Balancer داخلی

VPSها load balancer ندارن، پس:

انتخاب:

✅ MetalLB

LoadBalancer واقعی روی bare metal

کاملاً compatible
----------------------------------------
🔹 فاز 4 – Gateway API (نه Ingress!)
نصب:

Gateway API CRDs

Envoy Gateway یا Traefik

📌 اینجا دیگه Ingress نصب نمی‌کنی اصلاً.
------------------------------------------
🔹 فاز 5 – TLS و DNS

domain

Let’s Encrypt

DNS → VPS IPها
-------------------------------------------
🔹 فاز 6 – اولین اپ واقعی

deploy یک backend ساده

expose با HTTPRoute

تست HTTPS
-----------------------------------------
⚠️ چند نکته خیلی مهم
❌ نکن

نصب همه‌چی با اسکریپت‌های عجیب

k3s برای هدف بلندمدت (خوبه، ولی اینجا نه)

وابستگی به annotation

✅ بکن

YAMLها رو version control کن

هر فاز رو commit کن

مانیتورینگ رو از اول در نظر بگیر
------------------------------------------
🗺️ چک‌لیست سریع

 Ubuntu آماده

 containerd

 kubeadm cluster

 CNI

 MetalLB

 Gateway API

 Envoy Gateway

 HTTPS

 App 🚀
------------------------------------------

