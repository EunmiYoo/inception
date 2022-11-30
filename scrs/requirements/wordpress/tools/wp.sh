#!/bin/bash

#if [ ! -f /var/www/wordpress/wp-config.php ]; then

cd /var/www/wordpress

sed -i "s/database_name_here/$DATABASE_NAME/g" wp-config-sample.php
sed -i "s/username_here/$DATABASE_LOGIN/g" wp-config-sample.php
sed -i "s/password_here/$DATABASE_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/$DATABASE_HOSTNAME/g" wp-config-sample.php

cp wp-config-sample.php wp-config.php

cd /
wp core download --allow-root


wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_NAME} --admin_user=${WP_LOGIN} --admin_password=${WP_PASSWORD} --admin_email=${WP_EMAIL}

wp user create ${DATABASE_LOGIN} ${DATABASE_USER_EMAIL} --user_pass=${DATABASE_PASSWORD} --role=author --allow-root

#fi

exec /usr/sbin/php-fpm7.3 -F
