
NGINX := deb-nginx:12

up:
	docker compose up
# 	-d

down:
	docker compose down
# 	-d

build:
	docker build -t $(NGINX) -f nginx/Nginx.Dockerfile nginx
	docker run -i -t $(NGINX)
