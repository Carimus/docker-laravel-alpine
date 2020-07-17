#!/usr/bin/env bash

set -e

rm -rf ./php7.3-cli/ ./php7.3-fpm/
mkdir -p ./php7.3-cli/
mkdir -p ./php7.3-fpm/

cp ./Dockerfile.template ./php7.3-cli/Dockerfile
sed -i '' 's/__BASE_IMAGE__/php:7.3-cli-alpine/' ./php7.3-cli/Dockerfile
sed -i '' 's/__EXTRA_APK_PACKAGES__//' ./php7.3-cli/Dockerfile

cp ./Dockerfile.template ./php7.3-fpm/Dockerfile
sed -i '' 's/__BASE_IMAGE__/php:7.3-fpm-alpine/' ./php7.3-fpm/Dockerfile
sed -i '' 's/__EXTRA_APK_PACKAGES__/nginx/' ./php7.3-fpm/Dockerfile
