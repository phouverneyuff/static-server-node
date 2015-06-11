FROM ubuntu:latest

MAINTAINER Paulo Henrique <ph.ouverney@gmail.com>

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get -y update

# install python-software-properties (so you can do add-apt-repository)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-software-properties software-properties-common

# install utilities
RUN apt-get -y install vim git sudo zip bzip2 fontconfig curl

# install node.js
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
RUN apt-get install -y nodejs

# install yeoman
RUN npm install -g yo bower grunt-cli

RUN npm install -g node-static bower

RUN echo 'root:rootstatic' |chpasswd
RUN groupadd static && useradd static -s /bin/bash -m -g static -G static && adduser static sudo
RUN echo 'static:static' |chpasswd

VOLUME /public

EXPOSE 8282

CMD static -p 8282 /public
