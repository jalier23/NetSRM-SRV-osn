#!/bin/bash
sudo -i -u postgres psql -c "CREATE USER nextcloud WITH PASSWORD 'Stewq3212324';"
sudo -i -u postgres psql -c "CREATE DATABASE cloud OWNER nextcloud;"
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
ln -s /etc/angie/sites-available/cloud.conf /etc/angie/sites-enabled/cloud.conf
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
