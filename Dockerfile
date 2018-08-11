FROM ubuntu:16.04

RUN apt-get update -y && \
    apt-get install software-properties-common -y && \
    add-apt-repository -y ppa:git-core/ppa && \
    apt-get update -y && \
    apt-get install git -y

RUN apt-get update && \
    apt-get -y install sudo

RUN sudo apt-get install curl -y && \
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
    sudo apt-get install -y nodejs

RUN mkdir -p /var/wikijs && \
    cd /var/wikijs && \
    curl -sSo- https://wiki.js.org/install.sh | sudo bash

WORKDIR /var/wikijs

#EXPOSE 3000
EXPOSE 80

#CMD node wiki configure
CMD node server
