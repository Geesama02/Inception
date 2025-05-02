#!/bin/bash

set -e
set -x

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

mariadb-install-db --user=mysql

mysqld_safe &

sleep 5

mysql -u root --skip-password <<EOF
CREATE DATABASE IF NOT EXISTS \`${DATABASE_NAME}\`;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DATABASE_NAME}\`.* TO '${MARIADB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p"$MARIADB_ROOT_PASSWORD" shutdown


exec mysqld