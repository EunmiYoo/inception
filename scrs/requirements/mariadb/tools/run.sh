#!/bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$DATABASE_LOGIN'@'%' IDENTIFIED BY '$DATABASE_PASSWORD'" | mysql -u root
echo "GRANT ALL ON *.* TO '$DATABASE_LOGIN'@'%'" | mysql -u root

echo "FLUSH PRIVILEGES" | mysql -u root

service mysql stop

exec /usr/sbin/mysqld -u root
