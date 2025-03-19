
COMPOSE_PATH=./srcs/docker-compose.yml

DOCKER_COMPOSE=docker-compose -f ${COMPOSE_PATH}

all: build up 

up: 
	${DOCKER_COMPOSE} up

down:
	${DOCKER_COMPOSE} down

build:
	${DOCKER_COMPOSE} build

clean:
	${DOCKER_COMPOSE} down --volumes --remove-orphans

logs:
	${DOCKER_COMPOSE} logs

logs-f:
	${DOCKER_COMPOSE} logs -f

ps:
	${DOCKER_COMPOSE} ps

re:
	${DOCKER_COMPOSE} down
	${DOCKER_COMPOSE} up -d
.PHONY: all up up-d down build clean logs logs-f ps re