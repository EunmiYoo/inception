
#compose 	= cd scrs && sudo docker-compose

all:
	#sudo docker compose -f ./scrs/docker-compose.yml build
	sudo mkdir -p /home/eyoo/data/mariadb
	sudo mkdir -p /home/eyoo/data/wordpress
	sudo chmod 777 /etc/hosts
	sudo echo "127.0.0.1 eyoo.42.fr" >> /etc/hosts
#	cd scrs/
#	$(compose) build
#	$(compose) up -d 
	docker compose -f ./scrs/docker-compose.yml up -d --build 

clean:
#	$(compose) down

build: 
#	$(compose) build

re: 	fclean all

fclean:
	sudo docker system prune --volumes --all --force
	sudo docker stop $$(docker ps -qa);\
	sudo docker rm $$(docker ps -qa);\
	sudo docker rmi -f $$(docker images -qa);\
	sudo docker volume rm $$(docker volume ls -q);\
	sudo rm -rf /home/eyoo/data
	

.PHONY: all re down clean fclean
