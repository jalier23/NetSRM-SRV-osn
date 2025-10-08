#!/bin/bash
apt update
#ollama
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
sleep 2s
ollama pull gemma3
#collaboraoffice
apt install coolwsd code-brand collaboraofficebasis-ru collaboraoffice-dict-ru collaboraoffice-dict-en -y
coolconfig set server_name code.netsrm.ru
coolconfig set storage.wopi.host cloud.netsrm.ru
#docker
apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin nvidia-container-toolkit -y
sleep 2s
nvidia-ctk runtime configure --runtime=docker
systemctl restart docker
mkdir -p /opt/docker
mkdir -p /opt/docker/cadvisor
cd /opt/docker/cadvisor
wget https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/docker/cadvisor/docker-compose.yml
docker compose up -d
cd
cd /opt/docker
git clone https://github.com/nextcloud/nextcloud-talk-recording
cd /opt/docker/nextcloud-talk-recording
rm server.conf.in
wget https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/docker/nextcloud-talk-recording/server.conf.in
cd /opt/docker/nextcloud-talk-recording/docker-compose
rm docker-compose.yml
wget https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/docker/nextcloud-talk-recording/docker-compose.yml
cd
mkdir -p /opt/docker/dockge
mkdir -p /opt/docker/stacks
cd /opt/docker/dockge
wget https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/docker/dockge/docker-compose.yml
docker compose up -d
cd
#angie
apt install angie angie-module-brotli angie-module-zstd angie-console-light -y
sleep 2s
systemctl stop angie
rm /etc/angie/angie.conf
cd /etc/angie
wget https://github.com/jalier23/NetSRM-SRV-osn/raw/refs/heads/main/angie.zip
unzip angie.zip
rm angie.zip
mkdir -p /etc/angie/stream-enabled
cd
#db
apt update
apt install postgresql-17 postgresql-client-17 libpq-dev mariadb-server redis-server -y
sleep 2s
systemctl stop mariadb
rm /etc/mysql/mariadb.conf.d/50-server.cnf
cd /etc/mysql/mariadb.conf.d
wget https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/mariadb/50-server.cnf
cd
systemctl start mariadb
#php8.4
apt install imagemagick ffmpeg libopenblas-dev liblapack-dev build-essential graphicsmagick nodejs libsodium-dev -y
apt install php8.4-fpm php8.4-{common,pgsql,gd,curl,mbstring,intl,gmp,bcmath,xml,imagick,bz2,zip,ldap,smbclient,xmlrpc,soap,dev,redis} -y
sleep 2s
systemctl stop php8.4-fpm
rm /etc/php/8.4/fpm/php.ini
rm /etc/php/8.4/fpm/pool.d/www.conf
cd /etc/php/8.4/fpm
wget https://github.com/jalier23/NetSRM-SRV-osn/raw/refs/heads/main/php/8-4/php.ini
cd /etc/php/8.4/fpm/pool.d
wget https://github.com/jalier23/NetSRM-SRV-osn/raw/refs/heads/main/php/8-4/www.conf
cd
systemctl start php8.4-fpm
#php8.3
apt install php8.3-fpm php8.3-{common,cli,gd,mysql,mbstring,bcmath,xml,curl,zip,ldap} -y
sleep 2s
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
sleep 2s
systemctl stop php8.3-fpm
rm /etc/php/8.3/fpm/php.ini
rm /etc/php/8.3/fpm/pool.d/www.conf
cd /etc/php/8.3/fpm
wget https://github.com/jalier23/NetSRM-SRV-osn/raw/refs/heads/main/php/8-3/php.ini
cd /etc/php/8.3/fpm/pool.d
wget https://github.com/jalier23/NetSRM-SRV-osn/raw/refs/heads/main/php/8-3/www.conf
cd
systemctl start php8.3-fpm
systemctl start angie
npm i -g yarn
php -m
mysql_secure_installation
coolconfig set-admin-password
