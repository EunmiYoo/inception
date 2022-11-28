
all:
	#sudo docker compose -f ./scrs/docker-compose.yml build
	sudo mkdir -p /home/eyoo/data/mariadb
	sudo mkdir -p /home/eyoo/data/wordpress
	sudo chmod 777 /etc/hosts
	sudo echo "127.0.0.1 eyoo.42.fr" >> /etc/hosts
	docker compose -f ./scrs/docker-compose.yml up -d --build

down:
	docker compose -f ./scrs/docker-compose.yml down

build: 
	docker compose -f ./scrs/docker-compose.yml build

re: 	clean all

clean:
	sudo docker compose -f ./scrs/docker-compose.yml down

fclean:
	docker system prune --volumes --all --force
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	sudo rm -rf /home/eyoo/
	

.PHONY: all re down clean fclean
