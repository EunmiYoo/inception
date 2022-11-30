FROM		debian:buster
EXPOSE		3306

RUN			apt-get update -y
RUN			apt-get upgrade -y
RUN			apt-get install -y mariadb-server
#RUN			apt-get install -y dumb-init
		
COPY		tools/run.sh		/
RUN		chmod +x /run.sh

COPY		conf/my.cnf	/etc/mysql/
#RUN		chmod +x /etc/mysql/mariadb.conf.d/50-server.cnf
#RUN		mkdir -p /var/run/mysqld 
#RUN		touch /var/run/mysql/mysql.sock
#RUN		chowm  mysql:mysql /var/run/mysql 
#RUN		chmod +x /var/run/mysqld/
#ENTRYPOINT	["/usr/bin/dumb-init"]
CMD			["/run.sh"]

