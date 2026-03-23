

- **Nginx**: serwer www i reverse proxy obsługujący bezpieczne połączenia HTTPS.  
- **WordPress**: system zarządzania treścią (CMS), w którym zarządza się stroną.  
- **MariaDB**: relacyjna baza danych przechowująca wszystkie treści i konfiguracje strony.

### Uruchamianie i zatrzymywanie projektu
W terminalu w katalogu głównym projektu użyj Makefile:

- **Start**: uruchom `make up`, aby zainicjalizować i uruchomić wszystkie usługi w tle.  
- **Stop**: uruchom `make down`, aby bezpiecznie zatrzymać usługi bez usuwania danych.

### Dostęp do strony
- **Strona główna**: [https://kikwasni.42.fr](https://kikwasni.42.fr)  
- **Panel administracyjny**: [https://kikwasni.42.fr/wp-admin](https://kikwasni.42.fr/wp-admin)  
  *(Upewnij się, że w pliku hosts na lokalnej maszynie masz wpis `127.0.0.1 kikwasni.42.fr`.)*

### Lokalizacja i zarządzanie poświadczeniami
Wszystkie domyślne dane logowania (parametry bazy danych, konto administratora WordPress oraz standardowi użytkownicy) są centralnie przechowywane w pliku `.env` w katalogu głównym repozytorium.  

### Sprawdzanie statusu usług
Aby upewnić się, że system działa poprawnie:

- Uruchom `docker ps`, aby sprawdzić, czy kontenery nginx, wordpress i mariadb mają status "Up".  
- Uruchom `make test`, aby automatycznie przetestować połączenie z serwerem www.  
- Uruchom `docker compose logs`, aby sprawdzić błędy w tle.  

---

## English version

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