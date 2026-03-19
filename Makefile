LOGIN = kikwasni
DOMAIN = $(LOGIN).42.fr

COMPOSE = docker compose -f srcs/docker-compose.yml

DATA_PATH = /home/$(LOGIN)/data
DB_PATH = $(DATA_PATH)/mariadb
WP_PATH = $(DATA_PATH)/wordpress

all: up

create:
	mkdir -p $(DB_PATH)
	mkdir -p $(WP_PATH)
	sudo chmod -R 777 $(DATA_PATH)
	@if ! grep -q "$(DOMAIN)" /etc/hosts; then \
		echo "127.0.0.1 $(DOMAIN)" | sudo tee -a /etc/hosts > /dev/null ; \
	fi

up: create
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

start:
	$(COMPOSE) start

stop:
	$(COMPOSE) stop

restart:
	$(COMPOSE) restart

logs:
	$(COMPOSE) logs -f

clean: down
	sudo rm -rf $(DATA_PATH)
	@sudo sed -i "/$(DOMAIN)/d" /etc/hosts
	docker system prune -af --volumes

fclean: clean

re: fclean all

.PHONY: all create up down start stop restart logs clean fclean re