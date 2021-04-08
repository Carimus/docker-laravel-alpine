#!/usr/bin/env bash

set -e

rm -rf ./php7.3-cli/ ./php7.3-fpm/ ./php7.4-cli/ ./php7.4-fpm/ ./php8.0-cli/ ./php8.0-fpm/
mkdir -p ./php7.3-cli/
mkdir -p ./php7.3-fpm/
mkdir -p ./php7.4-cli/
mkdir -p ./php7.4-fpm/
mkdir -p ./php8.0-cli/
mkdir -p ./php8.0-fpm/

cp ./Dockerfile.template ./php7.3-cli/Dockerfile
sed -i '' 's/__BASE_IMAGE__/php:7.3-cli-alpine/' ./php7.3-cli/Dockerfile
sed -i '' 's/__PHPREDIS_VERSION__/4.2.0/' ./php7.3-cli/Dockerfile
sed -i '' 's/__EXTRA_APK_PACKAGES__//' ./php7.3-cli/Dockerfile

cp ./Dockerfile.template ./php7.3-fpm/Dockerfile
sed -i '' 's/__BASE_IMAGE__/php:7.3-fpm-alpine/' ./php7.3-fpm/Dockerfile
sed -i '' 's/__PHPREDIS_VERSION__/4.2.0/' ./php7.3-fpm/Dockerfile
sed -i '' 's/__EXTRA_APK_PACKAGES__/nginx/' ./php7.3-fpm/Dockerfile

cp ./Dockerfile.template ./php7.4-cli/Dockerfile
sed -i '' 's/__BASE_IMAGE__/php:7.4-cli-alpine/' ./php7.4-cli/Dockerfile
sed -i '' 's/__PHPREDIS_VERSION__/5.3.2/' ./php7.4-cli/Dockerfile
sed -i '' 's/__EXTRA_APK_PACKAGES__//' ./php7.4-cli/Dockerfile

cp ./Dockerfile.template ./php7.4-fpm/Dockerfile
sed -i '' 's/__BASE_IMAGE__/php:7.4-fpm-alpine/' ./php7.4-fpm/Dockerfile
sed -i '' 's/__PHPREDIS_VERSION__/5.3.2/' ./php7.4-fpm/Dockerfile
sed -i '' 's/__EXTRA_APK_PACKAGES__/nginx/' ./php7.4-fpm/Dockerfile

cp ./Dockerfile.template ./php8.0-cli/Dockerfile
sed -i '' 's/__BASE_IMAGE__/php:8.0-cli-alpine/' ./php8.0-cli/Dockerfile
sed -i '' 's/__PHPREDIS_VERSION__/5.3.2/' ./php8.0-cli/Dockerfile
sed -i '' 's/__EXTRA_APK_PACKAGES__//' ./php8.0-cli/Dockerfile

cp ./Dockerfile.template ./php8.0-fpm/Dockerfile
sed -i '' 's/__BASE_IMAGE__/php:8.0-fpm-alpine/' ./php8.0-fpm/Dockerfile
sed -i '' 's/__PHPREDIS_VERSION__/5.3.2/' ./php8.0-fpm/Dockerfile
sed -i '' 's/__EXTRA_APK_PACKAGES__/nginx/' ./php8.0-fpm/Dockerfile
