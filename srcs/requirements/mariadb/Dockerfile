FROM debian:bullseye

RUN apt update -y && \
    apt install -y --no-install-recommends mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/setup_db.sh /setup_db.sh
RUN chmod +x /setup_db.sh

EXPOSE 3306

CMD [ "/setup_db.sh" ]