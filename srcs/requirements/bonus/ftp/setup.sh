#!/bin/bash

set -e
set -x

export FTP_USER=$(cat $FTP_USER)
export FTP_PASS=$(cat $FTP_PASS)

useradd -d /var/www/wp -m ${FTP_USER} && echo "${FTP_USER}:${FTP_PASS}" | chpasswd && \
mkdir -p /var/run/vsftpd/empty && chmod 755 /var/run/vsftpd/empty && \
chown -R "$FTP_USER:$FTP_USER" /var/www/wp && \
chmod -R 755 /var/www/wp

exec vsftpd /etc/vsftpd.conf