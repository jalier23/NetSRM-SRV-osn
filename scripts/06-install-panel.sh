#!/bin/bash
mysql -u root --execute="CREATE USER 'pterodactyl'@'127.0.0.1' IDENTIFIED BY 'Swwqa22324521';"
mysql -u root --execute="CREATE DATABASE panel;"
mysql -u root --execute="GRANT ALL PRIVILEGES ON panel.* TO 'pterodactyl'@'127.0.0.1' WITH GRANT OPTION;"
mkdir -p /disk/web/panel
cd /disk/web/panel
curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
tar -xzvf panel.tar.gz
rm panel.tar.gz
wget https://github.com/BeastMark441/pterodactyl/releases/download/v1.11.9/resources.zip
unzip -o resources.zip
rm resources.zip
chmod -R 755 storage/* bootstrap/cache/
cp .env.example .env
COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --optimize-autoloader
yarn
export NODE_OPTIONS=--openssl-legacy-provider
yarn build:production
COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --optimize-autoloader
php artisan key:generate --force
php artisan p:environment:setup
php artisan p:environment:database
php artisan p:environment:mail
php artisan migrate --seed --force
php artisan p:user:make
chown -R www-data:www-data /disk/web/panel
cat <<EOF | $SUDO tee /etc/systemd/system/pteroq.service >/dev/null
# Pterodactyl Queue Worker File
# ----------------------------------

[Unit]
Description=Pterodactyl Queue Worker
After=redis-server.service

[Service]
# On some systems the user and group might be different.
# Some systems use `apache` or `nginx` as the user and group.
User=www-data
Group=www-data
Restart=always
ExecStart=/usr/bin/php /disk/web/panel/artisan queue:work --queue=high,standard,low --sleep=3 --tries=3
StartLimitInterval=180
StartLimitBurst=30
RestartSec=5s

[Install]
WantedBy=multi-user.target
EOF
systemctl enable --now pteroq.service
ln -s /etc/angie/sites-available/panel.conf /etc/angie/sites-enabled/panel.conf
