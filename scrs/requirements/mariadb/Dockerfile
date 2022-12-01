FROM		debian:buster
EXPOSE		3306

RUN			apt-get update -y
RUN			apt-get upgrade -y
RUN			apt-get install -y mariadb-server
		
COPY		tools/run.sh		/
RUN		chmod +x /run.sh

COPY		conf/my.cnf	/etc/mysql/
CMD			["/run.sh"]

