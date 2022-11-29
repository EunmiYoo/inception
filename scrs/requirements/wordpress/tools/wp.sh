#!/bin/bash

if [ ! -f /var/www/wordpress/wp-config.php ]; then

	cd /var/www/wordpress

	wp core download --allow-root

	mv /var/www/wp-config.php /var/www/wordpress/

	wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_NAME} --admin_user=${WP_LOGIN} --admin_password=${WP_PASSWORD} --admin_email=${WP_EMAIL}
	wp user create ${DATABASE_LOGIN} ${DATABASE_USER_EMAIL} --user_pass=${DATABASE_PASSWORD} --role=author --allow-root

fi

exec /usr/sbin/php-fpm7.3 -F
