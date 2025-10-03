#!/bin/bash
apt update
# Baze SQL
#postgresql
sudo -i -u postgres psql -c "CREATE USER nextcloud WITH PASSWORD 'Stewq3212324';"
sudo -i -u postgres psql -c "CREATE DATABASE cloud OWNER nextcloud;"
#mariadb
mysql -u root --execute="CREATE USER 'pterodactyl'@'127.0.0.1' IDENTIFIED BY 'Swwqa22324521';"
mysql -u root --execute="CREATE DATABASE panel;"
mysql -u root --execute="GRANT ALL PRIVILEGES ON panel.* TO 'pterodactyl'@'127.0.0.1' WITH GRANT OPTION;"
mysql -u root --execute="CREATE USER 'bookstack'@'127.0.0.1' IDENTIFIED BY 'Sdwe32451223';"
mysql -u root --execute="CREATE DATABASE wiki;"
mysql -u root --execute="GRANT ALL PRIVILEGES ON wiki.* TO 'bookstack'@'127.0.0.1' WITH GRANT OPTION;"
#Cloud
mkdir -p /disk/ssd/cloud/data
mkdir -p /disk/hdd/documents
mkdir -p /disk/hdd/image-disk
mkdir -p /disk/hdd/soft
cd /disk/web
wget https://github.com/nextcloud-releases/server/releases/download/v32.0.0/nextcloud-32.0.0.zip
unzip nextcloud-32.0.0.zip
rm nextcloud-32.0.0.zip
mv nextcloud cloud
cp -r /disk/web/cloud/core/skeleton /disk/ssd/cloud
cd /disk/web/cloud/apps
wget https://github.com/nextcloud-releases/calendar/releases/download/v6.0.0/calendar-v6.0.0.tar.gz
tar -xzvf calendar-v6.0.0.tar.gz
rm calendar-v6.0.0.tar.gz
wget https://github.com/nextcloud-releases/contacts/releases/download/v8.0.2/contacts-v8.0.2.tar.gz
tar -xzvf contacts-v8.0.2.tar.gz
rm contacts-v8.0.2.tar.gz
wget https://github.com/christianlupus-nextcloud/cookbook-releases/releases/download/v0.11.4/cookbook-0.11.4.tar.gz
tar -xzvf cookbook-0.11.4.tar.gz
rm cookbook-0.11.4.tar.gz
wget https://github.com/nextcloud-releases/files_accesscontrol/releases/download/v3.0.0/files_accesscontrol-v3.0.0.tar.gz
tar -xzvf files_accesscontrol-v3.0.0.tar.gz
rm files_accesscontrol-v3.0.0.tar.gz
wget https://github.com/nextcloud-releases/files_automatedtagging/releases/download/v3.0.0/files_automatedtagging-v3.0.0.tar.gz
tar -xzvf files_automatedtagging-v3.0.0.tar.gz
rm files_automatedtagging-v3.0.0.tar.gz
wget https://github.com/nextcloud-releases/forms/releases/download/v5.2.0/forms-v5.2.0.tar.gz
tar -xzvf forms-v5.2.0.tar.gz
rm forms-v5.2.0.tar.gz
wget https://github.com/nextcloud-releases/mail/releases/download/v5.5.6/mail-v5.5.6.tar.gz
tar -xzvf mail-v5.5.6.tar.gz
rm mail-v5.5.6.tar.gz
wget https://github.com/owncloud/music/releases/download/v2.3.0/music_2.3.0_for_nextcloud.tar.gz
tar -xzvf music_2.3.0_for_nextcloud.tar.gz
rm music_2.3.0_for_nextcloud.tar.gz
wget https://github.com/nextcloud-releases/assistant/releases/download/v2.8.0/assistant-v2.8.0.tar.gz
tar -xzvf assistant-v2.8.0.tar.gz
rm assistant-v2.8.0.tar.gz
wget https://github.com/nextcloud-releases/richdocuments/releases/download/v9.0.0/richdocuments-v9.0.0.tar.gz
tar -xzvf richdocuments-v9.0.0.tar.gz
rm richdocuments-v9.0.0.tar.gz
wget https://github.com/nextcloud-releases/notes/releases/download/v4.12.3/notes-v4.12.3.tar.gz
tar -xzvf notes-v4.12.3.tar.gz
rm notes-v4.12.3.tar.gz
wget https://github.com/nextcloud-releases/integration_openai/releases/download/v3.7.1/integration_openai-v3.7.1.tar.gz
tar -xzvf integration_openai-v3.7.1.tar.gz
rm integration_openai-v3.7.1.tar.gz
wget https://github.com/nextcloud-releases/user_oidc/releases/download/v8.0.0/user_oidc-v8.0.0.tar.gz
tar -xzvf user_oidc-v8.0.0.tar.gz
rm user_oidc-v8.0.0.tar.gz
wget https://git.mdns.eu/api/v4/projects/45/packages/generic/passwords/2025.10.0/passwords-lsr-81.tar.gz
tar -xzvf passwords.tar.gz
rm passwords.tar.gz
wget https://github.com/nextcloud-releases/quota_warning/releases/download/v1.22.0/quota_warning-v1.22.0.tar.gz
tar -xzvf quota_warning-v1.22.0.tar.gz
rm quota_warning-v1.22.0.tar.gz
wget https://github.com/nextcloud-releases/files_retention/releases/download/v3.0.0/files_retention-v3.0.0.tar.gz
tar -xzvf files_retention-v3.0.0.tar.gz
rm files_retention-v3.0.0.tar.gz
wget https://github.com/nextcloud-releases/spreed/releases/download/v22.0.0/spreed-v22.0.0.tar.gz
tar -xzvf spreed-v22.0.0.tar.gz
rm spreed-v22.0.0.tar.gz
wget https://github.com/nextcloud-releases/previewgenerator/releases/download/v5.10.0/previewgenerator-v5.10.0.tar.gz
tar -xzvf previewgenerator-v5.10.0.tar.gz
rm previewgenerator-v5.10.0.tar.gz
wget https://github.com/nextcloud-releases/notify_push/releases/download/v1.2.0/notify_push-v1.2.0.tar.gz
tar -xzvf notify_push-v1.2.0.tar.gz
rm notify_push-v1.2.0.tar.gz
wget https://github.com/nextcloud-releases/tables/releases/download/v0.9.5/tables-v0.9.5.tar.gz
tar -xzvf tables-v0.9.5.tar.gz
rm tables-v0.9.5.tar.gz
wget https://github.com/nextcloud-releases/deck/releases/download/v1.16.0/deck-v1.16.0.tar.gz
tar -xzvf deck-v1.16.0.tar.gz
rm deck-v1.16.0.tar.gz
wget https://github.com/nextcloud-releases/whiteboard/releases/download/v1.2.1/whiteboard-v1.2.1.tar.gz
tar -xzvf whiteboard-v1.2.1.tar.gz
rm whiteboard-v1.2.1.tar.gz
wget https://github.com/nextcloud-releases/files_confidential/releases/download/v3.3.0/files_confidential-v3.3.0.tar.gz
tar -xzvf files_confidential-v3.3.0.tar.gz
rm files_confidential-v3.3.0.tar.gz
cd
chown -R www-data:www-data /disk/web/cloud
chown -R www-data:www-data /disk/ssd/cloud
chown -R www-data:www-data /disk/hdd/documents
chown -R www-data:www-data /disk/hdd/image-disk
chown -R www-data:www-data /disk/hdd/soft
cat <<EOF | $SUDO tee /etc/systemd/system/nextcloudcron.service >/dev/null
[Unit]
Description=Nextcloud cron.php job

[Service]
User=www-data
ExecCondition=php -f /disk/web/cloud/occ status -e
ExecStart=/usr/bin/php -f /disk/web/cloud/cron.php
KillMode=process
EOF
cat <<EOF | $SUDO tee /etc/systemd/system/nextcloudcron.timer >/dev/null
[Unit]
Description=Run Nextcloud cron.php every 5 minutes

[Timer]
OnBootSec=5min
OnUnitActiveSec=5min
Unit=nextcloudcron.service

[Install]
WantedBy=timers.target
EOF
mkdir -p /opt/nextcloud-ai-worker
cat <<EOF | $SUDO tee /opt/nextcloud-ai-worker/taskprocessing.sh >/dev/null
#!/bin/sh
echo "Starting Nextcloud AI Worker $1"
cd /disk/web/cloud
sudo -E -u www-data php occ background-job:worker -t 30 'OC\TaskProcessing\SynchronousBackgroundJob'
EOF
chmod +x /opt/nextcloud-ai-worker/taskprocessing.sh
cat <<EOF | $SUDO tee /etc/systemd/system/nextcloud-ai-worker@.service >/dev/null
[Unit]
Description=Nextcloud AI worker %i
After=network.target

[Service]
ExecStart=/opt/nextcloud-ai-worker/taskprocessing.sh %i
Restart=always
StartLimitInterval=30
StartLimitBurst=10

[Install]
WantedBy=multi-user.target
EOF
cat <<EOF | $SUDO tee /etc/systemd/system/notify_push.service >/dev/null
[Unit]
Description = Push daemon for Nextcloud clients

[Service]
Environment=PORT=7867
Environment=NEXTCLOUD_URL=https://cloud.netsrm.ru
ExecStart=/disk/web/cloud/apps/notify_push/bin/x86_64/notify_push /disk/web/cloud/config/config.php
Type=notify
User=www-data

[Install]
WantedBy = multi-user.target
EOF
#Panel
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
#wiki-bookstack
git clone https://github.com/BookStackApp/BookStack.git --branch release --single-branch /disk/web/wiki
cat <<EOF | $SUDO tee /disk/web/wiki/.env >/dev/null
# This file, when named as ".env" in the root of your BookStack install
# folder, is used for the core configuration of the application.
# By default this file contains the most common required options but
# a full list of options can be found in the '.env.example.complete' file.

# NOTE: If any of your values contain a space or a hash you will need to
# wrap the entire value in quotes. (eg. MAIL_FROM_NAME="BookStack Mailer")

# Application key
# Used for encryption where needed.
# Run `php artisan key:generate` to generate a valid key.
APP_KEY=SomeRandomString

# Application URL
# This must be the root URL that you want to host BookStack on.
# All URLs in BookStack will be generated using this value
# to ensure URLs generated are consistent and secure.
# If you change this in the future you may need to run a command
# to update stored URLs in the database. Command example:
# php artisan bookstack:update-url https://old.example.com https://new.example.com
APP_URL=https://wiki.netsrm.ru
LOG_FAILED_LOGIN_MESSAGE="Failed login for %u"
QUEUE_CONNECTION=database

# Use dark mode by default
# Will be overridden by any existing user/session preference.
APP_DEFAULT_DARK_MODE=true

# Database details
DB_HOST=127.0.0.1
DB_DATABASE=wiki
DB_USERNAME=bookstack
DB_PASSWORD=Sdwe32451223

# Mail system to use
# Can be 'smtp' or 'sendmail'
MAIL_DRIVER=smtp

# Mail sender details
MAIL_FROM_NAME="wiki info"
MAIL_FROM=wiki-info@netsrm.ru

# SMTP mail options
# These settings can be checked using the "Send a Test Email"
# feature found in the "Settings > Maintenance" area of the system.
# For more detailed documentation on mail options, refer to:
# https://www.bookstackapp.com/docs/admin/email-webhooks/#email-configuration
MAIL_HOST=mail.netsrm.ru
MAIL_PORT=587
MAIL_USERNAME=wiki-info@netsrm.ru
MAIL_PASSWORD=Swqs312125
MAIL_ENCRYPTION=tls

# Sets application language to French
APP_LANG=ru

# Storage Options
STORAGE_TYPE=local

# Set both the cache and session to use redis
CACHE_DRIVER=redis
SESSION_DRIVER=redis

# Example of using a single local Redis server
REDIS_SERVERS=127.0.0.1:6379:0

# Only send cookies over a HTTPS connection.
# Ensure you have BookStack served over HTTPS before enabling.
# Defaults to 'false'
SESSION_SECURE_COOKIE=true

# Set the name of the cookie used by BookStack to track sessions.
# Defaults to 'bookstack_session'
SESSION_COOKIE_NAME=wiki-cookie

# Set the revision limit to 200
# Defaults to '100'
REVISION_LIMIT=30

# General auth
AUTH_METHOD=standard
#standard
#oidc
#ldap

# Set OIDC to be the authentication method
# Setting this to true enables auto-initiation.
AUTH_AUTO_INITIATE=true

# (Login with <name>)
OIDC_NAME=authentik

# Example: OIDC_DISPLAY_NAME_CLAIMS=given_name|family_name
OIDC_DISPLAY_NAME_CLAIMS=sso

# OAuth Client ID to access the identity provider
OIDC_CLIENT_ID=ebIxub1Z6qASypqE5l4xbH82MXZi3riptzEKMuo8

# OAuth Client Secret to access the identity provider
OIDC_CLIENT_SECRET=g3dJWVOcvX86phaFwXxQG2bHnkdKAv0CuhmD1f0rC1N6cbJ02fx1xflccWNSdwrP26NzZDq2dDXaP8CjSWTLSxT36a7eDw7JyyOjUXyFQXEAXNDWgK2MeXrNQ9KAgZYm

# Must start with 'https://'
OIDC_ISSUER=https://sso.netsrm.ru/application/o/wiki/

# Otherwise, this can be set as a specific URL endpoint.
OIDC_END_SESSION_ENDPOINT=true

# Avatar
OIDC_FETCH_AVATAR=true

# Enable auto-discovery of endpoints and token keys.
OIDC_ISSUER_DISCOVER=true

# Enable OIDC group sync.
OIDC_USER_TO_GROUPS=true

# Set the attribute from which BookStack will read groups names from.
OIDC_GROUPS_CLAIM=groups

# Multiple scopes can be added via comma separation.
OIDC_ADDITIONAL_SCOPES=groups

# BookStack settings view, will be considered a matched role and assigned to the user.
OIDC_REMOVE_FROM_GROUPS=true
EOF
cd /disk/web/wiki
composer install --no-dev
php artisan key:generate
php artisan migrate
cd
chown -R www-data:www-data /disk/web/wiki
cat <<EOF | $SUDO tee /etc/systemd/system/bookstack-queue.service >/dev/null
[Unit]
Description=BookStack Queue Worker

[Service]
User=www-data
Group=www-data
Restart=always
ExecStart=/usr/bin/php /disk/web/wiki/artisan queue:work --sleep=3 --tries=1 --max-time=3600

[Install]
WantedBy=multi-user.target
EOF
systemctl enable --now bookstack-queue.service
#Passwork
mkdir -p /disk/web/passwork
cd /disk/web/passwork
wget https://github.com/jalier23/NetSRM-SRV-osn/raw/refs/heads/main/Passwork-070104.zip
unzip Passwork-070104.zip
rm Passwork-070104.zip
cd
chown -R www-data:www-data /disk/web/passwork
#angie site
ln -s /etc/angie/sites-available/cloud.conf /etc/angie/sites-enabled/cloud.conf
ln -s /etc/angie/sites-available/panel.conf /etc/angie/sites-enabled/panel.conf
ln -s /etc/angie/sites-available/wiki.conf /etc/angie/sites-enabled/wiki.conf
#angie proxy
ln -s /etc/angie/proxy-available/Actual.conf /etc/angie/proxy-enabled/Actual.conf
ln -s /etc/angie/proxy-available/audiobook.conf /etc/angie/proxy-enabled/audiobook.conf
ln -s /etc/angie/proxy-available/calibre.conf /etc/angie/proxy-enabled/calibre.conf
ln -s /etc/angie/proxy-available/immich.conf /etc/angie/proxy-enabled/immich.conf
ln -s /etc/angie/proxy-available/karakeep.conf /etc/angie/proxy-enabled/karakeep.conf
