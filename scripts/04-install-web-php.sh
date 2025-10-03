#!/bin/bash
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
