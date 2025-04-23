FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
    apt install -y php-fpm && \
    mkdir -p /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

CMD [ "php-fpm7.4", "-F" ]