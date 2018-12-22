#!/usr/bin/env bash

set -e

echo "Building image for php7.2-cli (default image):"

docker build -t carimus/laravel-alpine:php7.2-cli \
  -t carimus/laravel-alpine:latest \
  -f ./php7.2-cli/Dockerfile \
  .

echo

echo "Building image for php7.2-fpm:"

docker build -t carimus/laravel-alpine:php7.2-fpm \
  -f ./php7.2-fpm/Dockerfile \
  .

echo

echo "Pushing images to docker hub:"

docker push carimus/laravel-alpine:php7.2-cli
docker push carimus/laravel-alpine:latest
docker push carimus/laravel-alpine:php7.2-fpm

echo

echo "Done"
