FROM debian:12-slim

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mysql /docker-entrypoint-initdb.d

COPY ./init.sql /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD=rootpass
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wpuser
ENV MYSQL_PASSWORD=wppass

EXPOSE 3306

CMD ["mysqld_safe"]