#!/bin/bash
apt update
ln -s /etc/angie/virtual-proxy/conf/vpn.conf /etc/angie/virtual-proxy/vpn/vpn.conf
angie -t
angie -s reload
#authentik-docker
mkdir -p /opt/docker/stacks/authentik
cd /opt/docker/stacks/authentik
wget https://goauthentik.io/docker-compose.yml
echo "PG_PASS=$(openssl rand -base64 36 | tr -d '\n')" >> .env
echo "AUTHENTIK_SECRET_KEY=$(openssl rand -base64 60 | tr -d '\n')" >> .env
echo "AUTHENTIK_ERROR_REPORTING__ENABLED=true" >> .env
echo "COMPOSE_PORT_HTTP=127.0.0.1:9000" >> .env
echo "COMPOSE_PORT_HTTPS=127.0.0.1:9443" >> .env
echo "AUTHENTIK_EMAIL__HOST=mail.netsrm.ru" >> .env
echo "AUTHENTIK_EMAIL__PORT=587" >> .env
echo "AUTHENTIK_EMAIL__USERNAME=info@netsrm.ru" >> .env
echo "AUTHENTIK_EMAIL__PASSWORD=Swer32456521" >> .env
echo "AUTHENTIK_EMAIL__USE_TLS=true" >> .env
echo "AUTHENTIK_EMAIL__USE_SSL=false" >> .env
echo "AUTHENTIK_EMAIL__TIMEOUT=10" >> .env
echo "AUTHENTIK_EMAIL__FROM=info@netsrm.ru" >> .env
ln -s /etc/angie/virtual-proxy/conf/sso.conf /etc/angie/virtual-proxy/sso/sso.conf
angie -t
angie -s reload
docker compose up -d
cd
#audiobookshelf-docker
mkdir -p /opt/docker/stacks/audiobookshelf
mkdir -p /disk/hdd/docker/audiobookshelf/audiobooks
mkdir -p /disk/hdd/docker/audiobookshelf/podcasts
mkdir -p /opt/docker/stacks/audiobookshelf/config
mkdir -p /opt/docker/stacks/audiobookshelf/metadata
cd /opt/docker/stacks/audiobookshelf
wget https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/docker/stacks/audiobookshelf/docker-compose.yml
ln -s /etc/angie/virtual-proxy/conf/audiobook.conf /etc/angie/virtual-proxy/enabled/audiobook.conf
docker compose up -d
cd
#immich-docker
mkdir -p /opt/docker/stacks/immich
mkdir -p /disk/hdd/docker/immich/library
cd /opt/docker/stacks/immich
wget -O docker-compose.yml https://github.com/immich-app/immich/releases/latest/download/docker-compose.yml
wget -O .env https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/docker/stacks/immich/esd.env
ln -s /etc/angie/virtual-proxy/conf/immich.conf /etc/angie/virtual-proxy/enabled/immich.conf
docker compose up -d
cd
#karakeep-docker
mkdir -p /opt/docker/stacks/karakeep
mkdir -p /opt/docker/stacks/karakeep/data
mkdir -p /opt/docker/stacks/karakeep/meili_data
mkdir -p /opt/docker/stacks/karakeep/ocr-data
cd /opt/docker/stacks/karakeep
wget https://raw.githubusercontent.com/jalier23/NetSRM-SRV-osn/refs/heads/main/docker/stacks/karakeep/docker-compose.yml
ln -s /etc/angie/virtual-proxy/conf/karakeep.conf /etc/angie/virtual-proxy/enabled/karakeep.conf
angie -t
angie -s reload
docker compose pull
cd
#vpn
/usr/local/openvpn_as/scripts/sacli --key "cs.priv_key" --value_file "/var/lib/angie/acme/vpn/private.key" ConfigPut
/usr/local/openvpn_as/scripts/sacli --key "cs.priv_key" --value_file "/var/lib/angie/acme/vpn/private.key" ConfigPut
/usr/local/openvpn_as/scripts/sacli start
#talk
ln -s /etc/angie/virtual-proxy/conf/talk.conf /etc/angie/virtual-proxy/talk/talk.conf
angie -t
angie -s reload
