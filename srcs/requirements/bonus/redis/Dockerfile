FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
    apt install -y redis-server

EXPOSE 6379

ENTRYPOINT ["redis-server", "--protected-mode no"]