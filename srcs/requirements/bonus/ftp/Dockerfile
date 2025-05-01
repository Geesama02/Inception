FROM debian:bullseye

RUN apt update -y && \
    apt install -y vsftpd openssl

ARG FTP_USER
ARG FTP_PASS
    
RUN sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf && \
    sed -i "s/listen_ipv6=YES/listen_ipv6=NO/" /etc/vsftpd.conf && \
    sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf && \
    echo "pasv_enable=YES\npasv_min_port=21000\npasv_max_port=21010\nlocal_root=/var/www/wp" >> /etc/vsftpd.conf
    
RUN useradd -d /var/www/wp -m ${FTP_USER} && echo "${FTP_USER}:${FTP_PASS}" | chpasswd

EXPOSE 21 21000-21010

CMD ["vsftpd", "/etc/vsftpd.conf"]