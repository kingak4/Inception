FROM debian:12-slim

RUN apt-get update && apt-get install -y \
    php \
    php-fpm \
    php-mysql \
    curl \
    wget

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN mv wordpress/* .
RUN rm -rf wordpress latest.tar.gz

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY setup.sh .

RUN chmod +x setup.sh

CMD ["./setup.sh"]