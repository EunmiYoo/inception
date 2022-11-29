FROM	debian:buster

EXPOSE	9000

RUN		apt-get update
RUN		apt-get -y install php-fpm\
		php-mysql\
		curl\
		tar \
		mariadb-client
#		dumb-init

COPY			./tools/wp.sh		/	
RUN			curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN			chmod +x wp-cli.phar
RUN			mv wp-cli.phar /usr/local/bin/wp

#wordpress intall
RUN			curl -LO https://wordpress.org/latest.tar.gz
RUN			tar xzvf latest.tar.gz
RUN			rm latest.tar.gz

RUN			mkdir -p /var/www
RUN			mv wordpress /var/www/
RUN			chown -R www-data:www-data /var/www/
COPY			conf/wp-config.php /var/www/wordpress/
RUN			mkdir /run/php
RUN			echo "listen =0.0.0.0:9000" >> /etc/php/7.3/fpm/pool.d/www.conf


#ENTRYPOINT		["/usr/bin/dumb-init"]
RUN			chmod +x /wp.sh

EXPOSE			9000
CMD 			["/wp.sh"]
#CMD			["usr/sbin/php-fpm7.3", "-F"]
