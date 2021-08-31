FROM ryanwclark/nginx:debian-latest
LABEL maintainer="Ryan Clark (ryanwclark@yahoo.com)"

ENV LOGCHIMP_VERSION=master \
    NGINX_WEBROOT=/app/server/public/

RUN apt-get update && \
    apt-get upgrade && \
    apt add -y git \
                nodejs \
                yarn \
                postgresql-client \
                && \
    git clone https://github.com/logchimp/logchimp /app && \
    cd app && \
    git checkout ${LOGCHIMP_VERSION} && \
    yarn install && \
    yarn frontend:build && \
ADD install /
