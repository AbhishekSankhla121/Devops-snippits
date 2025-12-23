#!/bin/bash
set -e

KUBE_DIR="$HOME/.kube"
KUBE_CONFIG="$KUBE_DIR/config"

WORKERS=(
  "abhishek@k9s-worker1.abhishek.local"
  "abhishek@k9s-worker.abhishek.local"
)

echo "📁 Creating kube config directory..."
mkdir -p "$KUBE_DIR"

echo "📄 Copying admin kubeconfig..."
sudo cp /etc/kubernetes/admin.conf "$KUBE_CONFIG"

echo "🔑 Fixing permissions..."
sudo chown "$(id -u):$(id -g)" "$KUBE_CONFIG"
chmod 600 "$KUBE_CONFIG"

echo "🚀 Distributing kubeconfig to workers..."
for NODE in "${WORKERS[@]}"; do
  echo "➡️  Copying kubeconfig to $NODE"
  ssh "$NODE" "mkdir -p ~/.kube"
  scp "$KUBE_CONFIG" "$NODE:~/.kube/config"
done

echo "✅ Kubeconfig distributed successfully."
