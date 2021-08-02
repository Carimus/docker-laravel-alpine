#!/usr/bin/env bash

# Download phpredis sources to a dir that docker-php-ext-install will look in and make it aware it's there.
export PHPREDIS_VERSION="${PHPREDIS_VERSION-4.2.0}"
echo "Using phpredis version: $PHPREDIS_VERSION"
mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts

# Install mysql, mysqli, opcache, phpredis, and pcntl
NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1)
docker-php-ext-install "-j${NPROC}" pdo pdo_mysql pdo_pgsql mysqli opcache redis pcntl gd bcmath posix zip
