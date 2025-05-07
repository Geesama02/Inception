FROM debian:bullseye

RUN apt update -y && \
    apt install -y nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY files/ /var/www/html/

EXPOSE 8000

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]