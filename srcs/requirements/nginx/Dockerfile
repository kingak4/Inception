FROM debian:12-slim

RUN apt-get update && apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

COPY default.conf /etc/nginx/conf.d/default.conf
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

EXPOSE 443

CMD ["/setup.sh"]