#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

set -x

apt install jq -y

# Fetch the Argo CD default admin password secret
secret=$(kubectl get secret -n argocd argocd-initial-admin-secret -o json)

# Extract the encoded password
encoded_password=$(echo "$secret" | jq -r '.data.password')

# Decode the password
decoded_password=$(echo "$encoded_password" | base64 --decode)

# Print the password
echo "Argo CD default admin password: $decoded_password"

