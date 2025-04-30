FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
    apt install -y redis-server

EXPOSE 6379

CMD ["redis-server", "--protected-mode no"]