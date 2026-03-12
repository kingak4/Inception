FROM debian:12-slim

RUN apt-get update && \
    apt-get install -y nginx openssl bash && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/conf.d /var/log/nginx /var/www/html

COPY default.conf /etc/nginx/conf.d/

COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

ENTRYPOINT ["/setup.sh"]

EXPOSE 443