#!/bin/sh

BACKUP_DIR=$(date '+%Y-%m-%d')
WWW_DIR="/var/www/html/homeautomation"
TELLSTICK_CONF="/etc/tellstick.conf"

mkdir $BACKUP_DIR 
mysqldump -u root homeautomation > $BACKUP_DIR/homeautomation_mysql_dump.sql 
cp -r $WWW_DIR $BACKUP_DIR/.
cp $TELLSTICK_CONF $BACKUP_DIR/.
cp homeautomation_backup.sh $BACKUP_DIR/. 
tar -cvf $BACKUP_DIR.tar $BACKUP_DIR/
rm -fr $BACKUP_DIR
