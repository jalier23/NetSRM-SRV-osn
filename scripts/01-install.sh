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
# docker
apt update
apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin nvidia-container-toolkit -y
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
mkdir -p /opt/docker/stacks/actual
mkdir -p /opt/docker/stacks/actual/data
cd /opt/docker/stacks/actual
wget https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/docker/stacks/actual/docker-compose.yml
docker compose pull
cd
mkdir -p /opt/docker/stacks/audiobookshelf
mkdir -p /disk/hdd/docker/audiobookshelf/audiobooks
mkdir -p /disk/hdd/docker/audiobookshelf/podcasts
mkdir -p /opt/docker/stacks/audiobookshelf/config
mkdir -p /opt/docker/stacks/audiobookshelf/metadata
cd /opt/docker/stacks/audiobookshelf
wget https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/docker/stacks/audiobookshelf/docker-compose.yml
docker compose pull
cd
mkdir -p /opt/docker/stacks/authentik
cd /opt/docker/stacks/authentik
wget https://goauthentik.io/docker-compose.yml
echo "PG_PASS=$(openssl rand -base64 36 | tr -d '\n')" >> .env
echo "AUTHENTIK_SECRET_KEY=$(openssl rand -base64 60 | tr -d '\n')" >> .env
echo "AUTHENTIK_ERROR_REPORTING__ENABLED=true" >> .env
echo "COMPOSE_PORT_HTTP=127.0.0.1:9001" >> .env
echo "COMPOSE_PORT_HTTPS=127.0.0.1:9444" >> .env
echo "AUTHENTIK_EMAIL__HOST=mail.netsrm.ru" >> .env
echo "AUTHENTIK_EMAIL__PORT=587" >> .env
echo "AUTHENTIK_EMAIL__USERNAME=sso-info@netsrm.ru" >> .env
echo "AUTHENTIK_EMAIL__PASSWORD=Sdsq32453423" >> .env
echo "AUTHENTIK_EMAIL__USE_TLS=true" >> .env
echo "AUTHENTIK_EMAIL__USE_SSL=false" >> .env
echo "AUTHENTIK_EMAIL__TIMEOUT=10" >> .env
echo "AUTHENTIK_EMAIL__FROM=sso-info@netsrm.ru" >> .env
docker compose pull
cd
mkdir -p /opt/docker/stacks/calibre-web
mkdir -p /opt/docker/stacks/calibre-web/config
mkdir -p /opt/docker/stacks/calibre-web/books
cd /opt/docker/stacks/calibre-web
wget https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/docker/stacks/calibre-web/docker-compose.yml
docker compose pull
cd /opt/docker/stacks/calibre-web/books
wget https://github.com/janeczku/calibre-web/raw/refs/heads/master/library/metadata.db
chmod 777 metadata.db
cd
mkdir -p /opt/docker/stacks/docs
cd /opt/docker/stacks/docs
wget https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/docker/stacks/docs/docker-compose.yml
docker compose pull
cd
mkdir -p /opt/docker/stacks/immich
mkdir -p /opt/docker/stacks/immich
mkdir -p /disk/hdd/docker/immich/library
cd /opt/docker/stacks/immich
wget -O docker-compose.yml https://github.com/immich-app/immich/releases/latest/download/docker-compose.yml
wget -O .env https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/docker/stacks/immich/esd.env
docker compose pull
cd
mkdir -p /opt/docker/stacks/karakeep
mkdir -p /opt/docker/stacks/karakeep/data
mkdir -p /opt/docker/stacks/karakeep/meili_data
mkdir -p /opt/docker/stacks/karakeep/ocr-data
cd /opt/docker/stacks/karakeep
wget https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/docker/stacks/karakeep/docker-compose.yml
docker compose pull
cd
mkdir -p /opt/docker/stacks/nextcloud-talk
cd /opt/docker/stacks/nextcloud-talk
wget https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/docker/stacks/nextcloud-talk/docker-compose.yml
docker compose pull
cd
mkdir -p /opt/docker/stacks/nextcloud-whiteboard
cd /opt/docker/stacks/nextcloud-whiteboard
wget https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/docker/stacks/nextcloud-whiteboard/docker-compose.yml
docker compose pull
cd
#angie php
apt update
apt install angie postgresql-17 postgresql-client-17 libpq-dev mariadb-server mongodb-org redis-server -y
apt install angie-module-brotli angie-module-zstd angie-console-light -y
sleep 30s
systemctl stop angie
rm /etc/angie/angie.conf
cd /etc/angie
wget https://github.com/jalier23/NetSRM-SRV-osn/raw/refs/heads/main/angie.zip
unzip angie.zip
rm angie.zip
mkdir -p /etc/angie/proxy-enabled
mkdir -p /etc/angie/sites-enabled
mkdir -p /etc/angie/stream-enabled
openssl dhparam -out /etc/angie/dhparam.pem 2048
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/angie/ssl/angie.key -out /etc/angie/ssl/angie.crt
cd
apt install imagemagick ffmpeg libopenblas-dev liblapack-dev build-essential graphicsmagick nodejs libsodium-dev -y
apt install php-fpm php-{json,common,pgsql,mysql,sqlite3,gd,curl,mbstring,intl,gmp,bcmath,xml,imagick,bz2,zip,ldap,smbclient,tokenizer,xmlrpc,soap,dev,pear,redis} -y
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
systemctl restart php8.3-fpm
pecl install mongodb
pecl install brotli
cd /opt
git clone https://github.com/davisking/dlib.git
cd dlib/dlib
mkdir build
cd build
cmake -DBUILD_SHARED_LIBS=ON ..
make
make install
cd /opt
git clone https://github.com/goodspb/pdlib.git
cd pdlib
phpize
./configure --enable-debug
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig ./configure --enable-debug
make
make install
cd
echo "extension=mongodb.so" | tee /etc/php/8.3/fpm/conf.d/20-mongodb.ini
echo "extension=mongodb.so" | tee /etc/php/8.3/cli/conf.d/20-mongodb.ini
echo "extension=brotli.so" | tee /etc/php/8.3/fpm/conf.d/20-brotli.ini
echo "extension=brotli.so" | tee /etc/php/8.3/cli/conf.d/20-brotli.ini
echo "extension=pdlib.so" | tee /etc/php/8.3/fpm/conf.d/20-pdlib.ini
echo "extension=pdlib.so" | tee /etc/php/8.3/cli/conf.d/20-pdlib.ini
systemctl restart php8.3-fpm
systemctl start angie
npm i -g yarn
php -m
