DOCKER_COMPOSE_FILE := ./srcs/docker-compose.yml
DATA_DIR := ${HOME}/data

build:
	mkdir -p $(DATA_DIR)/mariadb
	mkdir -p $(DATA_DIR)/wordpress
	docker-compose -f $(DOCKER_COMPOSE_FILE) build

up:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

re: down up

logs:
	docker-compose -f $(DOCKER_COMPOSE_FILE) logs -f

clean:
	rm -rf $(DATA_DIR)/mariadb
	rm -rf $(DATA_DIR)/wordpress
	docker-compose -f $(DOCKER_COMPOSE_FILE) down --volumes --remove-orphans
	docker rmi -f $$(docker images -q)
	docker volume prune --force
	docker network prune --force

.PHONY: build up down re logs clean
