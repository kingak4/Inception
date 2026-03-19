FROM debian:12-slim

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    curl \
    wget \
    mariadb-client && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i 's|listen = .*|listen = 0.0.0.0:9000|' /etc/php/*/fpm/pool.d/www.conf

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    mv wordpress/* . && \
    rm -rf wordpress latest.tar.gz

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY wp-config.php /wp-config.php

COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

EXPOSE 9000

CMD ["/setup.sh"]