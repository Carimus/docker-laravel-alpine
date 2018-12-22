#!/usr/bin/env bash

set -e

rm -rf ./php7.2-cli/ ./php7.2-fpm/
mkdir -p ./php7.2-cli/
mkdir -p ./php7.2-fpm/

cp ./Dockerfile.template ./php7.2-cli/Dockerfile
sed -i '' 's/__BASE_IMAGE__/php:7.2-cli-alpine/' ./php7.2-cli/Dockerfile
sed -i '' 's/__EXTRA_APK_PACKAGES__//' ./php7.2-cli/Dockerfile

cp ./Dockerfile.template ./php7.2-fpm/Dockerfile
sed -i '' 's/__BASE_IMAGE__/php:7.2-fpm-alpine/' ./php7.2-fpm/Dockerfile
sed -i '' 's/__EXTRA_APK_PACKAGES__/nginx/' ./php7.2-fpm/Dockerfile
