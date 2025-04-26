#!/bin/bash

until mysqladmin ping -h"${WORDPRESS_DB_HOST}" --silent; do
    sleep 2
done

wp config create --dbname="${WORDPRESS_DB_NAME}" \
                --dbhost="${WORDPRESS_DB_HOST}" \
                --dbuser="${WORDPRESS_DB_USER}" \
                --dbpass="${WORDPRESS_USER_PASSWORD}" \
                --allow-root

wp core install --url="${WORDPRESS_URL}" \
                --title="${WORDPRESS_TITLE}" \
                --admin_user="${WORDPRESS_ADMIN_USER}" \
                --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
                --admin_email="${WORDPRESS_ADMIN_EMAIL}" \
                --skip-email \
                --allow-root

exec php-fpm7.4 -F
