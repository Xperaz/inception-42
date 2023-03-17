DOCKER_COMPOSE=docker-compose

DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

.PHONY: kill build down clean restart

build:
	mkdir -p /home/aouhadou/data/mysql
	mkdir -p /home/aouhadou/data/wordpress
	@$(DOCKER_COMPOSE)  -f $(DOCKER_COMPOSE_FILE) up --build -d
kill:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) kill
down:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down
clean:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v

fclean: clean
	rm -r /home/aouhadou/data/mysql
	rm -r /home/aouhadou/data/wordpress
	docker system prune -a -f

restart: clean build