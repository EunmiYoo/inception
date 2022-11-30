#!/bin/bash

#if [ ! -f /var/www/wordpress/wp-config.php ]; then

wp core download --allow-root && wp core config --allow-root --dbname=$DATABASE_NAME --dbuser=$DATABASE_LOGIN --dbpass=$DATABASE_PASSWORD --dbhost=$DATABASE_HOSTNAME;

sed -i "s/database_name_here/$DATABASE_NAME/g" /var/www/wordpress/wp-config-sample.php
sed -i "s/username_here/$DATABASE_LOGIN/g" /var/www/wordpress/wp-config-sample.php
sed -i "s/password_here/$DATABASE_PASSWORD/g" /var/www/wordpress/wp-config-sample.php
sed -i "s/localhost/$DATABASE_HOSTNAME/g" /var/www/wordpress/wp-config-sample.php

cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

wp core install --allow-root --url=${WP_URL} --title=${WP_NAME} --admin_user=${WP_LOGIN} --admin_password=${WP_PASSWORD} --admin_email=${WP_EMAIL}

wp user create ${DATABASE_LOGIN} ${DATABASE_USER_EMAIL} --user_pass=${DATABASE_PASSWORD} --role=author --allow-root

#fi

exec /usr/sbin/php-fpm7.3 -F
