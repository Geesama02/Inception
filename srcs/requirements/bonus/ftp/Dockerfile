FROM debian:bullseye

RUN apt update -y && \
    apt install -y vsftpd openssl
    
COPY setup.sh /setup.sh

RUN sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf && \
    sed -i "s/listen_ipv6=YES/listen_ipv6=NO/" /etc/vsftpd.conf && \
    sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf && \
    echo "pasv_enable=YES\npasv_min_port=21000\npasv_max_port=21010\nlocal_root=/var/www/wp" >> /etc/vsftpd.conf && \
	chmod +x /setup.sh

EXPOSE 21 21000-21010

ENTRYPOINT ["/setup.sh"]