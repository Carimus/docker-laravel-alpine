#!/usr/bin/env bash

set -e

mkdir -p ./php7.2-cli/
mkdir -p ./php7.2-fpm/

sed s/__BASE_IMAGE__/php:7.2-cli-alpine/ < ./Dockerfile.template > ./php7.2-cli/Dockerfile
sed s/__BASE_IMAGE__/php:7.2-fpm-alpine/ < ./Dockerfile.template > ./php7.2-fpm/Dockerfile
