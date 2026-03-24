# Developer Documentation – Inception

## 1. Environment Setup from Scratch

**Prerequisites:** 
Ensure the following are installed on your host system:

- Docker 
- Docker Compose 
- make 

**Project Configuration:** 

1. Create a `.env` file at the root of the repository. 
2. Fill in the required environment variables, e.g.: 
   - `MYSQL_ROOT_PASSWORD` 
   - `MYSQL_USER` 
   - `MYSQL_PASSWORD` 
   - `WORDPRESS_DB_PASSWORD` 
3. Map the local IP to your test domain in `/etc/hosts`, e.g.:  127.0.0.1 kikwasni.42.fr


---

## 2. Building and Launching

The project uses a Makefile to simplify Docker Compose commands:

| Command       | Description |
|---------------|-------------|
| `make create`  | Initializes host directories for data binding and sets up /etc/hosts entry. |
| `make build`  | Builds Docker images from each service’s Dockerfile. |
| `make up`     | Runs `setup`, `build`, and starts the containers in detached mode (`docker compose up -d`). |

---

## 3. Container and Volume Management

| Command                     | Description |
|------------------------------|-------------|
| `make down`                  | Safely stops all running containers. |
| `make clean`                 | Stops containers, prunes unused volumes, deletes local data folders. |
| `make fclean`                | Extends `clean` by fully clearing Docker system cache. |
| `make re`                    | Full project reset (`fclean` + `up`). |
| `docker compose logs -f`     | Follow container logs in real time. |

---

## 4. Data Storage and Persistence

- **WordPress Files:** volume `wp_data`, mapped to `/home/<kikwasni>/data/wp`. 
- **Database Content:** volume `db_data`, mapped to `/home/<kikwasni>/data/db`. 
- Both volumes must be named and configured via `driver_opts` to persist data across rebuilds.
