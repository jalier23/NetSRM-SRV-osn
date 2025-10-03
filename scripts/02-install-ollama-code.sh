#!/bin/bash
wget -P /opt https://ollama.com/download/ollama-linux-amd64.tgz
tar -C /usr -xzf /opt/ollama-linux-amd64.tgz
rm /opt/ollama-linux-amd64.tgz
useradd -r -s /bin/false -U -m -d /usr/share/ollama ollama
usermod -a -G ollama $(whoami)
mkdir -p /opt/ollama
chown -R ollama:ollama /opt/ollama
cat <<EOF | $SUDO tee /etc/systemd/system/ollama.service >/dev/null
[Unit]
Description=Ollama Service
After=network-online.target

[Service]
ExecStart=/usr/bin/ollama serve
User=ollama
Group=ollama
Restart=always
RestartSec=3
Environment="PATH=$PATH"
Environment="OLLAMA_HOST=0.0.0.0"
Environment="OLLAMA_ORIGINS=*"
Environment="OLLAMA_MODELS=/opt/ollama"
Environment="OLLAMA_NUM_PARALLEL=4"
Environment="OLLAMA_MAX_LOADED_MODELS=4"

[Install]
WantedBy=default.target
EOF
systemctl daemon-reload
systemctl enable ollama
systemctl start ollama
sleep 10s
ollama pull gemma3
sleep 10s
apt update
apt install coolwsd code-brand collaboraofficebasis-ru collaboraoffice-dict-ru collaboraoffice-dict-en -y
coolconfig set-admin-password
coolconfig set server_name code.netsrm.ru
coolconfig set storage.wopi.host cloud.netsrm.ru
