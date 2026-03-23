#!/bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mariadbd-safe --datadir='/var/lib/mysql' --skip-networking &

until mariadb-admin --socket=/run/mysqld/mysqld.sock ping; do
    echo "Czekam na uruchomienie MariaDB..."
    sleep 2
done

mariadb -u root << EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

mariadb-admin -u root -p${MYSQL_ROOT_PASSWORD} --socket=/run/mysqld/mysqld.sock shutdown

exec mariadbd --user=mysql --datadir=/var/lib/mysql --bind-address=0.0.0.0
