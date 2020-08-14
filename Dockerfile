FROM ubuntu:latest

WORKDIR /root
COPY install.sh ./
COPY run.sh ./
RUN bash ./install.sh

EXPOSE 6060
CMD [ "bash" , "./run.sh" ]
