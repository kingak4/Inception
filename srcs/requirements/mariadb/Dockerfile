FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

COPY init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 3306

ENTRYPOINT ["/init.sh"]