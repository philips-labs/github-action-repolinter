FROM node:10-alpine

LABEL maintainer="jeroen.knoops@philips.com"

WORKDIR /repolinter/repo

RUN apk add --no-cache \
  git \
  && rm -rf /var/cache/apk/*

COPY repolint.json /repolinter/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
