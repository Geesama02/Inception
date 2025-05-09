FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
    apt install -y curl tar ca-certificates

WORKDIR /app

RUN mkdir -p /data && \
	curl -L -o portainer.tar.gz https://github.com/portainer/portainer/releases/download/2.27.5/portainer-2.27.5-linux-amd64.tar.gz

RUN tar -xzf portainer.tar.gz --strip-components=1 && \
	rm portainer.tar.gz

EXPOSE 9443

CMD ["/app/portainer", "--data", "/data"]