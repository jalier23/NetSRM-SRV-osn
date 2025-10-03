#!/bin/bash
apt update
timedatectl set-timezone Asia/Yekaterinburg
apt install language-pack-ru language-pack-en -y
apt update
apt update && apt upgrade -y
apt install gcc-12 g++-12 unzip bzip2 brotli cmake git -y
apt install nvidia-driver-570-server nvidia-cuda-toolkit -y
wget https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz
tar xvfz node_exporter-1.9.1.linux-amd64.tar.gz
cd node_exporter-1.9.1.linux-amd64/
mv ./node_exporter /usr/local/bin/
cd
useradd --no-create-home --shell /bin/false node_exporter
chown node_exporter:node_exporter /usr/local/bin/node_exporter
cat <<EOF | $SUDO tee /etc/systemd/system/node_exporter.service >/dev/null
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter
Nice=-10
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
rm node_exporter-1.9.1.linux-amd64.tar.gz
rm -r node_exporter-1.9.1.linux-amd64
systemctl enable --now node_exporter.service
bash <(curl -fsS https://packages.openvpn.net/as/install.sh) --yes --as-version 3.0.0
apt-mark hold openvpn-as
