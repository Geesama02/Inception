FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
    apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -newkey rsa:4096 \
    -keyout /etc/nginx/ssl/key.pem \
    -out /etc/nginx/ssl/certificate.pem \
    -days 365 \
    -subj "/CN=localhost"

COPY conf/config.conf /etc/nginx/nginx.conf

EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]