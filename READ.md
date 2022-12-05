#########################  basic cammand for docker #######################################

 ## docker status && container list (도커 상태 또는 컨테이너 리스트 보기)
 
 docker ps
 
 docker-compose ps

 ## Acess to the each container (각 컨테이너 접근)

1)  docker exec -it 컨테이너이름 /bin/bash 


2)  docker-compose exec mariadb /bin/bash (Cab access only in the folder which have docker-compose file)

######################### Notions #################################################################

1) How Docker and docker-compose work :

-Docker Compose is a Docker tool to install and run multi-container applications. It needs docker-compose.yaml file. 

-Docker Compose est un outil Docker utilisé pour définir et exécuter des applications multi-conteneurs. Il a besionde ficher de yml. 

2) diffence with docker-compose and without docker-compose

Docker(without docker-compose) installs multiple services into a single container. 

On the other hand, Docker Compose installs multiple services in multiple containers and connects them to create a single service.


3) Benefits of docker compare to VM 

Docker containers are process-isolated and don’t require a hardware hypervisor. 

This means Docker containers are much smaller and require far fewer resources than a VM.

Docker is fast. Very fast. While a VM can take an at least a few minutes to boot and be dev-ready, it takes anywhere from a few milliseconds to (at most) a few seconds to start a Docker container from a container image.


####################### nginx check point ########################################################## 

1) TLS12, TLS13 CHECK

openssl s_client -connect eyoo.42.fr:443 -tls1_2

openssl s_client -connect eyoo.42.fr:443 -tls1_3


2) Self-signed certificate warning appear.

3) curl -k http://eyoo.42.fr  (check port 80)


###################### wordpress check point ####################################################### 

1)volume connect 

docker volume ls 
/home/eyoo/data/  (peut modifier POUR CHECK-> docker exec -it mariadb bash)  path: /var/lib/mysql ) 

2)connection check with mariadb

mysql -u eyoo -p1234 -h "IP" 

wp user list --allow-root (admin, author)


2) comment 더하기 

3) 관리자계정으로 데시보드 확인하기  

4) 관리자계정으로 페이지 편집 확인 


############## mariadb check list 

1) volume connect

docker volume ls (VOLUME LIST) 

docker inspect -f "{{.Mounts}}" <nom/id du container>


2) login root / eyoo

mysql -u root -p1233

mysql -u eyoo -p1234 


3) check user  

docker exec -it mariadb /bin/bash

mysql 

use mysql;

select user, host from user; 

SHOW DATABASES; --> db 확인 
SHOW VARIABLES; --> 환경변수 확인



hostname i----> IP CHECK(POUR WORDPRESS)


########### mariadb config############################################


 ### intall pakages
 apt-get update -y
 apt-get upgrade -y
 apt-get -y install mariadb-server
 apt-get install -y vim

 ### config file 

 vim /etc/mysql/my.conf

 bind-addres  = 0.0.0.0
 port 3306

 -->docker 파일에서는 미리 고쳐놓은 config파일을 복사한다. .

 tool/run.sh 파일로 mysql에 접속하여 이름 및 패스워드 설정

 .env 파일에 이름및 패스워드 넣기

 run.sh 파일 권한 바꾸기 (chmod 111)

 ./run.sh 실행하기



############ wordpress config ##########################


####### install pakages
RUN		apt-get update -y &&\
		apt-get upgrade -y
RUN		apt-get -y install php7.3\
		php-fpm\
		php-mysql\
		mariadb-client\
		wget\
		curl\
		tar

##### wordpress pakages download (압축풀고 var/www 로 옮긴다.  
	
wget (sur linux)
curl -LO 옵션 추가하여 돌림 (맥)
(--location 리다이렉션 url로 따라간다. -O 파일 저장시 리모트에 저장되어있던 이름을 그대로 가져와서 로컬에 저장)

##### php7.3 fpm 설정파일인  pool.d에  listen = 9000을 추가한다 

RUN	 echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

#### 워드프레스의 소유자를 www-data로 바꾸어 준다.

### wp-config.php 파일 옮기기 (옮겨도 환경변수가 중복사용이 안되어 실행파일에서 다시 잡아주어야함)
COPY		conf/wp-config.php /var/www/wordpress/
COPY		tools/run.sh	/
RUN		chmod +x /run.sh
CMD		["run.sh"]


######### wp.sh  #################
wordpress client download (wp-cli 는 워드프레스를 커맨드라인에서 다룰수 있는 유틸리티로 커맨드라인에서 wordpress 설치/upgrade 나 plugin 설치/삭제등 모든 관리 작업을 할 수 있다.) -php,curl 필요 



wordpress core download et configuration 
add user, add admin. 


############# PID1 check

ps -elf 
