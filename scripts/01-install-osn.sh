#!/bin/bash
apt update
#collaboraoffice rep
wget -P /usr/share/keyrings https://collaboraoffice.com/downloads/gpg/collaboraonline-release-keyring.gpg
cat <<EOF | $SUDO tee /etc/apt/sources.list.d/collaboraonline.sources >/dev/null
Types: deb
URIs: https://www.collaboraoffice.com/repos/CollaboraOnline/CODE-deb
Suites: ./
Signed-By: /usr/share/keyrings/collaboraonline-release-keyring.gpg
EOF
#nvidia-container rep
wget -qO /etc/apt/keyrings/nvidia-container-toolkit.asc https://nvidia.github.io/libnvidia-container/gpgkey
echo "deb [signed-by=/etc/apt/keyrings/nvidia-container-toolkit.asc] https://nvidia.github.io/libnvidia-container/stable/deb/amd64 /" | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
#angie rep
curl -o /etc/apt/trusted.gpg.d/angie-signing.gpg \
            https://angie.software/keys/angie-signing.gpg
echo "deb https://download.angie.software/angie/$(. /etc/os-release && echo "$ID/$VERSION_ID $VERSION_CODENAME") main" \
    | sudo tee /etc/apt/sources.list.d/angie.list > /dev/null
apt update
#docker rep
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
# nodejs rep
curl -sL https://deb.nodesource.com/setup_22.x | sudo -E bash -
#postgresql rep
install -d /usr/share/postgresql-common/pgdg
curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc
. /etc/os-release
sh -c "echo 'deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $VERSION_CODENAME-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
# MariaDB-11 rep
curl -o /etc/apt/keyrings/mariadb-keyring.pgp 'https://mariadb.org/mariadb_release_signing_key.pgp'
cat <<EOF | $SUDO tee /etc/apt/sources.list.d/mariadb.sources >/dev/null
# MariaDB 11.8 repository list - created 2025-10-01 04:15 UTC
# https://mariadb.org/download/
X-Repolib-Name: MariaDB
Types: deb
# deb.mariadb.org is a dynamic mirror if your preferred mirror goes offline. See https://mariadb.org/mirrorbits/ for details.
# URIs: https://deb.mariadb.org/11.8/ubuntu
URIs: https://mirror.truenetwork.ru/mariadb/repo/11.8/ubuntu
Suites: noble
Components: main main/debug
Signed-By: /etc/apt/keyrings/mariadb-keyring.pgp
EOF
apt update
#time lang update drv
timedatectl set-timezone Asia/Yekaterinburg
apt install language-pack-ru language-pack-en -y
apt upgrade -y
apt install gcc-12 g++-12 unzip bzip2 protobuf-compiler git python3 zip brotli cmake git -y
apt install nvidia-driver-570-server nvidia-cuda-toolkit -y
#node_exporter
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
apt update
#mscorefonts
apt install ttf-mscorefonts-installer -y
#ca-certificates
cd /usr/local/share/ca-certificates
wget https://github.com/jalier23/NetSRM-SRV-osn/raw/refs/heads/main/opv/NetSRM-CA.crt
cd
update-ca-certificates
add-apt-repository ppa:ondrej/php
#openvpnas
bash <(curl -fsS https://packages.openvpn.net/as/install.sh) --yes --as-version 3.0.0
sleep 2s
systemctl stop openvpnas
rm /usr/local/openvpn_as/lib/python/pyovpn-2.0-py3.12.egg
cd /usr/local/openvpn_as/lib/python
wget https://github.com/jalier23/NetSRM-SRV-osn/raw/refs/heads/main/opv/pyovpn-2.0-py3.12.egg
cd
systemctl start openvpnas
apt-mark hold openvpn-as
