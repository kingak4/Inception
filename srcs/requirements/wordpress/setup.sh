#!/bin/bash

cd /var/www/html

wp core install \
--url=$DOMAIN_NAME \
--title="Inception" \
--admin_user=$WP_ADMIN_USER \
--admin_password=$WP_ADMIN_PASSWORD \
--admin_email=$WP_ADMIN_EMAIL \
--allow-root

php-fpm8.2 -F