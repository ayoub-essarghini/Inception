COMPOSE_PATH := ./srcs/docker-compose.yml
DOCKER_COMPOSE := docker-compose -f $(COMPOSE_PATH)

.PHONY: all up up-d down build clean fclean logs ps re

all: build up-d

up: 
	$(DOCKER_COMPOSE) up

up-d: 
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

build:
	$(DOCKER_COMPOSE) build

clean:
	$(DOCKER_COMPOSE) down --volumes --remove-orphans

fclean: clean
	docker system prune -a --force

logs:
	$(DOCKER_COMPOSE) logs

ps:
	$(DOCKER_COMPOSE) ps

re: down up-d
