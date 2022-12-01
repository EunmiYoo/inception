#!/bin/bash

#wp core install (gerer users ! ) 
wp core download --allow-root && wp core config --allow-root --dbname=$DATABASE_NAME --dbuser=$DATABASE_LOGIN --dbpass=$DATABASE_PASSWORD --dbhost=$DATABASE_HOSTNAME;

#wp-config.php configure
sed -i "s/database_name_here/$DATABASE_NAME/g" /var/www/wordpress/wp-config-sample.php
sed -i "s/username_here/$DATABASE_LOGIN/g" /var/www/wordpress/wp-config-sample.php
sed -i "s/password_here/$DATABASE_PASSWORD/g" /var/www/wordpress/wp-config-sample.php
sed -i "s/localhost/$DATABASE_HOSTNAME/g" /var/www/wordpress/wp-config-sample.php

cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

# admin create
wp core install --allow-root --url=${WP_URL} --title=${TITLE} --admin_user=${WP_LOGIN} --admin_password=${WP_PASSWORD} --admin_email=${WP_EMAIL}

#user2 create
wp user create ${USER2_LOGIN} ${USER2_EMAIL} --user_pass=${USER2_PASSWORD} --role=author --allow-root


exec /usr/sbin/php-fpm7.3 -F
