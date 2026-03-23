# User Documentation

### Services Provided
This project provides an isolated, ready-to-use WordPress hosting environment:

- **Nginx**: web server and reverse proxy handling secure HTTPS connections. 
- **WordPress**: Content Management System (CMS) for managing the website. 
- **MariaDB**: relational database storing all site content and configurations.

### Starting and Stopping the Project
Use the Makefile in the project root:

- **Start**: run `make up` to initialize and start all services in the background. 
- **Stop**: run `make down` to safely stop services without deleting any data.

### Accessing the Website
- **Main Website**: [https://kikwasni.42.fr](https://kikwasni.42.fr) 
- **Administration Panel**: [https://kikwasni.42.fr/wp-admin](https://kikwasni.42.fr/wp-admin) 
  *(Ensure you have mapped `127.0.0.1 kikwasni.42.fr` in your local hosts file.)*

### Locating and Managing Credentials
All default system credentials (database parameters, WordPress admin, and standard user accounts) are stored centrally in the `.env` file at the root of the repository. 

### Checking Service Status
To verify that the system is running correctly:

- Run `docker ps` to check that nginx, wordpress, and mariadb containers are "Up". 
- Run `make test` to automatically test the web server connection. 
- Run `docker compose logs` to check for any background errors.
