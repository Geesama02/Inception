FROM debian:bullseye

RUN apt update -y && \
    apt install -y php php-mysqli curl && \
    mkdir -p /var/www/html && \
    curl -L -o /var/www/html/index.php https://github.com/vrana/adminer/releases/download/v5.2.1/adminer-5.2.1.php && \
    chmod -R 755 /var/www/html

EXPOSE 8081

ENTRYPOINT ["php", "-S", "0.0.0.0:8081", "-t", "/var/www/html"]