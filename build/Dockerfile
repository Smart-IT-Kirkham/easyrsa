FROM alpine:3.11

ENV VERSION=3.0.8

RUN apk upgrade --update && apk add openssl

RUN wget -O- https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.8/EasyRSA-3.0.8.tgz | tar -C / -zx && mv EasyRSA-3.0.8/* /usr/local/bin && chown -R root:root /usr/local/bin

ADD vars /usr/local/bin/vars
