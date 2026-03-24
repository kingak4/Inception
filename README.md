*This project has been created as part of the 42 curriculum by [kikwasni](https://github.com/kingak4)*

<p align="center">
  <img src="inception.png" alt="Webserv Preview" width="250"/>
</p>


## 📌 Description
The Inception project is a system administration exercise designed to broaden knowledge of virtualization using Docker. 
Its goal is to set up a small, functional infrastructure on a personal Virtual Machine, using a multi-container architecture where each service runs in its dedicated, isolated container. 

This project includes:
- **NGINX** container as the entry point with TLSv1.2 or TLSv1.3.
- **WordPress + php-fpm** container (without NGINX).
- **MariaDB** container (without NGINX).
- Persistent storage using Docker Named Volumes for WordPress files and database.
- A custom Docker network connecting all containers.
- Automatic container restart in case of crash.
---

## 🛠️ Instructions
### 🔧 Environment Setup

To enable local domain resolution, add the following entry to your `/etc/hosts` file:

127.0.0.1 kikwasni.42.fr

Before running make up, copy the example environment file and set your own credentials:
```bash
cp srcs/.env_example srcs/.env
```
Then open srcs/.env and update the following variables with your own secure passwords and usernames:

- `MYSQL_ROOT_PASSWORD`
- `MYSQL_USER`
- `MYSQL_PASSWORD`
- `WORDPRESS_DB_PASSWORD`

This ensures your sensitive data is stored safely and the services will start correctly.

---

### 🚀 Build and Launch

The project includes a Makefile that automates the full deployment process. 
It prepares the required data directories, builds all Docker images, and starts the containers in detached mode.
```bash
make up
```

---

### 🌐 Service Access

Once running, the website is available at:

https://kikwasni.42.fr

---

### 🛑 Stopping Services

To gracefully shut down all running containers:
```bash
make down
```

---

### 🧹 Full Cleanup

To remove the entire environment — including containers, images, volumes, and stored data:
```bash
make fclean
```

## Virtual Project Design Choices & Comparisons

#### Machines vs Docker
Unlike VMs, which virtualize hardware and run a full OS, Docker virtualizes the OS kernel, making containers much more lightweight and faster to start.

#### Secrets vs Environment Variables
Environment variables are used for general configuration, while Docker Secrets are used for sensitive data (like DB passwords) to ensure they are not exposed in the image layers or Git history.

#### Docker Network vs Host Network
Using `network: host` is forbidden. A dedicated Docker network is used to isolate container communication and provide internal service discovery.

#### Docker Volumes vs Bind Mounts
Bind mounts link to a specific host path, while Docker Named Volumes are managed by Docker itself, providing better performance and portability for WordPress data and databases.

## 📚 Resources
### 📖 Documentation & Articles

- [Docker Documentation](https://docs.docker.com/)
- [Nginx Documentation](https://nginx.org/en/docs/)
- [MariaDB Knowledge Base](https://mariadb.com/kb/en/)



### Video Tutorials
- **Docker Networking Fundamentals** 
  https://www.youtube.com/watch?v=bKFMS5C4CG0 
  High‑level explanation of Docker networking concepts and how container networks work.

- **Docker Crash Course for Beginners** 
  https://www.youtube.com/watch?v=pg19Z8LL06w 
  Introductory crash course covering Docker basics for absolute beginners.

## AI Usage

AI was used to support the project in the following ways:

- **Assistance in writing necessary documentation**, including USER_DOC.md and DEV_DOC.md. 
- **Guidance on Docker concepts and best practices**, such as container isolation, named volumes, environment variables, Docker networking, and TLS configuration. 
- **Learning testing and debugging of Docker setups**, helping to understand how to validate configurations and inspect container behavior.

All AI-generated suggestions were critically reviewed and adapted to the project, ensuring accuracy and proper understanding of Docker and project-specific concepts.
