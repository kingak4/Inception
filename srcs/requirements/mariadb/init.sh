#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mariadbd-safe --datadir='/var/lib/mysql' --skip-networking &

until mariadb-admin ping; do
    sleep 2
done

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"

mariadb-admin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

exec mariadbd --user=mysql --datadir=/var/lib/mysql --bind-address=0.0.0.0