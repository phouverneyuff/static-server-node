FROM debian:wheezy

RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl python build-essential git ca-certificates
RUN mkdir /nodejs && curl http://nodejs.org/dist/v0.12.4/node-v0.12.4-linux-x64.tar.gz | tar xvzf - -C /nodejs --strip-components=1

ENV PATH $PATH:/nodejs/bin

RUN npm install -g node-static

VOLUME /public

EXPOSE 8282

CMD static -p 8282 /public
