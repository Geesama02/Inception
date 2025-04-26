FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
    apt install -y php-fpm \
    php-mysql \
    mariadb-client \
    curl && \
    mkdir -p /run/php

WORKDIR /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    wp core download --allow-root && \
    chown -R www-data:www-data /var/www/html

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/setup_wp.sh /setup_wp.sh
RUN chmod +x /setup_wp.sh

EXPOSE 9000

CMD [ "/setup_wp.sh"]