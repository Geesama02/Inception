#!/bin/bash

set -e
set -x

export WORDPRESS_DB_USER=$(cat $WORDPRESS_DB_USER)
export WORDPRESS_USER_PASSWORD=$(cat $WORDPRESS_USER_PASSWORD)
export WORDPRESS_ADMIN_USER=$(cat $WORDPRESS_ADMIN_USER)
export WORDPRESS_ADMIN_PASSWORD=$(cat $WORDPRESS_ADMIN_PASSWORD)

until mysqladmin ping -h"${WORDPRESS_DB_HOST}" --silent; do
    sleep 2
done

if [ ! -f /var/www/html/wp-config.php ]; then

    wp config create --dbname="${WORDPRESS_DB_NAME}" \
                    --dbhost="${WORDPRESS_DB_HOST}" \
                    --dbuser="${WORDPRESS_DB_USER}" \
                    --dbpass="${WORDPRESS_USER_PASSWORD}" \
                    --path="/var/www/html" \
                    --allow-root
fi


if ! wp core is-installed --allow-root; then
    wp core install --url="${WORDPRESS_URL}" \
                    --title="${WORDPRESS_TITLE}" \
                    --admin_user="${WORDPRESS_ADMIN_USER}" \
                    --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
                    --admin_email="${WORDPRESS_ADMIN_EMAIL}" \
                    --path="/var/www/html" \
                    --skip-email \
                    --allow-root
    
    wp user create $WORDPRESS_DB_USER $WORDPRESS_USER_EMAIL --user_pass=${WORDPRESS_USER_PASSWORD} --allow-root
fi

wp option update siteurl "$WORDPRESS_URL" --allow-root
wp option update home "$WORDPRESS_URL" --allow-root

wp plugin install redis-cache --activate --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp config set WP_CACHE true --allow-root
wp redis enable --allow-root

exec php-fpm7.4 -F
