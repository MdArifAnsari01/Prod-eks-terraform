#!/bin/bash
set -e

sudo apt update -y
sudo apt install -y unzip

#awscli

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update

#kubectl

curl -LO https://dl.k8s.io/release/v1.32.0/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl

#terraform

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt-get install -y terraform

#helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh


# non-interactive or headless installation

# Step 1: Get public IP automatically
ENDPOINT=$(curl -s ifconfig.me)

# Step 2: Download the OpenVPN installer
curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
chmod +x openvpn-install.sh

# Step 3: Run installer in non-interactive mode
AUTO_INSTALL=y \
ENDPOINT=$ENDPOINT \
APPROVE_INSTALL=y \
APPROVE_IP=y \
IPV6_SUPPORT=n \
PORT_CHOICE=1 \
PROTOCOL_CHOICE=2 \
DNS=1 \
COMPRESSION_ENABLED=n \
CUSTOMIZE_ENC=n \
CLIENT=arif \
PASS=1 \
sudo -E bash openvpn-install.sh
