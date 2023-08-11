FROM php:8.1-cli-alpine

WORKDIR /opt

# Install apk packages we want
RUN apk add -Uuv \
    git bash supervisor freetype-dev libjpeg-turbo-dev libzip-dev \
    libpng-dev postgresql-dev  \
    && rm -rf /var/cache/apk/*

# Install wait-for-it
RUN curl https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh > /opt/wait-for-it.sh \
    && chmod +x /opt/wait-for-it.sh \
    && ln -s /opt/wait-for-it.sh /usr/bin/wait-for-it

# Download and install composer
ARG COMPOSER_COMMIT_HASH=70527179915d55b3811bebaec55926afd331091b
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/${COMPOSER_COMMIT_HASH}/web/installer -O - -q | php -- --quiet
RUN chmod +x /opt/composer.phar \
    && ln -s /opt/composer.phar /usr/bin/composer

# Install PHP extensions
ENV PHPREDIS_VERSION 5.3.7
COPY support/install-extensions.sh /opt/install-extensions.sh
RUN /opt/install-extensions.sh

# Install awscli
RUN apk -v --update add \
        python3 \
        py-pip \
        groff \
        less \
        mailcap \
        aws-cli \
        s3cmd \
        && \
    pip install --upgrade python-magic && \
    rm /var/cache/apk/*