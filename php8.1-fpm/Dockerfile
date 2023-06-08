FROM php:8.1-fpm-alpine

WORKDIR /opt

# Install apk packages we want
RUN apk add -Uuv \
    git bash supervisor freetype-dev libjpeg-turbo-dev libzip-dev \
    libpng-dev postgresql-dev nginx \
    && rm -rf /var/cache/apk/*

# Install wait-for-it
RUN curl https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh > /opt/wait-for-it.sh \
    && chmod +x /opt/wait-for-it.sh \
    && ln -s /opt/wait-for-it.sh /usr/bin/wait-for-it

# Download and install composer
ARG COMPOSER_COMMIT_HASH=da7be05fa1c9f68b9609726451d1aaac7dd832cb
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/${COMPOSER_COMMIT_HASH}/web/installer -O - -q | php -- --quiet
RUN chmod +x /opt/composer.phar \
    && ln -s /opt/composer.phar /usr/bin/composer

# Install PHP extensions
ENV PHPREDIS_VERSION 5.3.2
COPY support/install-extensions.sh /opt/install-extensions.sh
RUN /opt/install-extensions.sh

# Install awscli
RUN apk -v --update add \
        python2 \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.20.11 s3cmd==2.1.0 python-magic && \
    rm /var/cache/apk/*
