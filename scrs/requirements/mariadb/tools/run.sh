#!/bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$DATABASE_LOGIN'@'%'"| mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO '$DATABASE_LOGIN'@'%' IDENTIFIED BY '$DATABASE_PASSWORD'"| mysql -u root

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD'" | mysql -u root 
echo "FLUSH PRIVILEGES" | mysql -u root

mysqladmin -u root -p$ROOT_PASSWORD shutdown

exec /usr/bin/mysqld_safe
