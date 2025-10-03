#!/bin/bash
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
