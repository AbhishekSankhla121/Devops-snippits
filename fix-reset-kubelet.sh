#!/bin/bash
set -euo pipefail

echo "🛑 Stopping kubelet..."
sudo systemctl stop kubelet || true
sudo systemctl disable kubelet || true

echo "🔫 Killing any leftover kubelet process..."
sudo pkill kubelet || true

echo "🔄 Resetting kubeadm..."
sudo kubeadm reset -f

echo "🧹 Cleaning Kubernetes state..."
sudo rm -rf \
  /etc/kubernetes \
  /var/lib/kubelet \
  /var/lib/etcd \
  /etc/cni/net.d \
  /var/lib/cni \
  /var/lib/calico \
  /var/run/kubernetes

echo "🌐 Cleaning CNI interfaces..."
for link in cni0 flannel.1; do
  sudo ip link delete "$link" 2>/dev/null || true
done

for link in $(ip -o link show | awk -F': ' '{print $2}' | grep '^cali'); do
  sudo ip link delete "$link" 2>/dev/null || true
done

echo "🗑 Cleaning kube config..."
rm -rf "$HOME/.kube"

echo "🔄 Restarting container runtime..."
if systemctl is-active --quiet containerd; then
  sudo systemctl restart containerd
elif systemctl is-active --quiet docker; then
  sudo systemctl restart docker
else
  echo "❌ No container runtime found"
  exit 1
fi

echo "🚫 Disabling swap..."
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab

echo "🔓 Re-enabling kubelet..."
sudo systemctl enable kubelet

echo "🔍 Verifying port 10250 is free..."
if sudo ss -lntp | grep -q 10250; then
  echo "❌ Port 10250 still in use"
  sudo ss -lntp | grep 10250
  exit 1
fi

echo "✅ Node reset complete. Ready for kubeadm join."
