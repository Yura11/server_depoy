FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    bash 

RUN mkdir -p /usr/local/Server
WORKDIR /usr/local/Server

COPY Server/ /usr/local/Server/

RUN chmod +x /usr/local/Server/Server.x86_64

EXPOSE 7778

CMD ["bash", "-c", "./Server.x86_64"]
