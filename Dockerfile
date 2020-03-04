FROM alpine:3.9.5

RUN apk upgrade --update && apk add openssl

RUN wget -O- https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.6/EasyRSA-unix-v3.0.6.tgz | tar -C / -zx && mv EasyRSA-v3.0.6/* /usr/local/bin && chown -R root:root /usr/local/bin

ADD vars /usr/local/bin/vars
