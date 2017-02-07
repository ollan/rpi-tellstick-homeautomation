#!/bin/bash

echo "deb http://download.telldus.com/debian/ stable main" > /etc/apt/sources.list.d/telldus.list && \
    wget -qO - http://download.telldus.se/debian/telldus-public.key | apt-key add -

apt-get update
apt-get -y install mysql-server apache2 libapache2-mod-php5 php5-gd php5-mysqlnd at telldus-core libtelldus-core2 libtelldus-core-dev subversion
apt-get -y upgrade
apt-get -y autoremove
apt-get -y autoclean

cp at.deny /etc/.
touch /etc/cron.deny

cp tellstick.conf /etc/.

mkdir -p /var/www/html/homeautomation

[[ ! -d "/var/www/html/homeautomation/.svn" ]] && \
	svn co svn://karpero.mine.nu/homeautomation /var/www/html/homeautomation
 
svn update /var/www/html/homeautomation

find /var/www/html/homeautomation -iname "*.php" | xargs chmod +x

chown -R www-data:www-data /var/www/html/homeautomation

mysqladmin -u root -p create homeautomation

usermod -G plugdev www-data

echo 'MODE="0666"' > /etc/udev/rules.d/99-tellstick.rules

service apache2 restart
service telldusd restart
service mysql restart
