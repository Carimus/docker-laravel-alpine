#!/usr/bin/env bash

set -e

GIT_STATUS="$(git status -s)"
GIT_SHORT_COMMIT="$(git rev-parse --short HEAD)"

REPO_NAME="carimus/laravel-alpine"
CLI_TAG_SUFFIX="-cli"
FPM_TAG_SUFFIX="-fpm"
CLI_TAG_73="php7.3$CLI_TAG_SUFFIX"
FPM_TAG_73="php7.3$FPM_TAG_SUFFIX"
CLI_TAG_74="php7.4$CLI_TAG_SUFFIX"
FPM_TAG_74="php7.4$FPM_TAG_SUFFIX"
CLI_TAG_80="php8.0$CLI_TAG_SUFFIX"
FPM_TAG_80="php8.0$FPM_TAG_SUFFIX"
CLI_TAG_81="php8.1$CLI_TAG_SUFFIX"
FPM_TAG_81="php8.1$FPM_TAG_SUFFIX"
CLI_TAG_82="php8.2$CLI_TAG_SUFFIX"
FPM_TAG_82="php8.2$FPM_TAG_SUFFIX"

if [[ -n "$GIT_STATUS" ]]; then
  echo "There are untracked changes or the working tree is dirty."
  echo "The image is tagged with the short git commit so please commit any changes before publishing."
  exit 1
fi

echo "Will build images with the following tags:"
echo -e "Based on php:8.2-cli-alpine:\t$CLI_TAG_82, latest, $GIT_SHORT_COMMIT, $GIT_SHORT_COMMIT-$CLI_TAG_82"
echo -e "Based on php:8.2-fpm-alpine:\t$FPM_TAG_82, $GIT_SHORT_COMMIT-$FPM_TAG_82"
echo -e "Based on php:8.1-cli-alpine:\t$CLI_TAG_81, $GIT_SHORT_COMMIT-$CLI_TAG_81"
echo -e "Based on php:8.1-fpm-alpine:\t$FPM_TAG_81, $GIT_SHORT_COMMIT-$FPM_TAG_81"
echo -e "Based on php:8.0-cli-alpine:\t$CLI_TAG_80, $GIT_SHORT_COMMIT-$CLI_TAG_80"
echo -e "Based on php:8.0-fpm-alpine:\t$FPM_TAG_80, $GIT_SHORT_COMMIT-$FPM_TAG_80"
echo -e "Based on php:7.4-cli-alpine:\t$CLI_TAG_74, $GIT_SHORT_COMMIT-$CLI_TAG_74"
echo -e "Based on php:7.4-fpm-alpine:\t$FPM_TAG_74, $GIT_SHORT_COMMIT-$FPM_TAG_74"
echo -e "Based on php:7.3-cli-alpine:\t$CLI_TAG_73, $GIT_SHORT_COMMIT-$CLI_TAG_73"
echo -e "Based on php:7.3-fpm-alpine:\t$FPM_TAG_73, $GIT_SHORT_COMMIT-$FPM_TAG_73"
echo

echo "Building image based on php:8.2-cli-alpine (default image):"

docker build \
  -t carimus/laravel-alpine:$CLI_TAG_82 \
  -t carimus/laravel-alpine:latest \
  -t carimus/laravel-alpine:$GIT_SHORT_COMMIT \
  -t carimus/laravel-alpine:$GIT_SHORT_COMMIT-$CLI_TAG_82 \
  -f ./php8.2-cli/Dockerfile \
  .

echo

echo "Building image based on php:8.2-fpm-alpine:"

docker build \
  -t carimus/laravel-alpine:$FPM_TAG_82 \
  -t carimus/laravel-alpine:$GIT_SHORT_COMMIT-$FPM_TAG_82 \
  -f ./php8.2-fpm/Dockerfile \
  .

echo

echo "Building image based on php:8.1-cli-alpine:"

docker build \
  -t carimus/laravel-alpine:$CLI_TAG_81 \
  -t carimus/laravel-alpine:$GIT_SHORT_COMMIT-$CLI_TAG_81 \
  -f ./php8.1-cli/Dockerfile \
  .

echo

echo "Building image based on php:8.1-fpm-alpine:"

docker build \
  -t carimus/laravel-alpine:$FPM_TAG_81 \
  -t carimus/laravel-alpine:$GIT_SHORT_COMMIT-$FPM_TAG_81 \
  -f ./php8.1-fpm/Dockerfile \
  .

echo

echo "Building image based on php:8.0-cli-alpine:"

docker build \
  -t carimus/laravel-alpine:$CLI_TAG_80 \
  -t carimus/laravel-alpine:$GIT_SHORT_COMMIT-$CLI_TAG_80 \
  -f ./php8.0-cli/Dockerfile \
  .

echo

echo "Building image based on php:8.0-fpm-alpine:"

docker build \
  -t carimus/laravel-alpine:$FPM_TAG_80 \
  -t carimus/laravel-alpine:$GIT_SHORT_COMMIT-$FPM_TAG_80 \
  -f ./php8.0-fpm/Dockerfile \
  .

echo

echo "Building image based on php:7.4-cli-alpine:"

docker build \
  -t carimus/laravel-alpine:$CLI_TAG_74 \
  -t carimus/laravel-alpine:$GIT_SHORT_COMMIT-$CLI_TAG_74 \
  -f ./php7.4-cli/Dockerfile \
  .

echo

echo "Building image based on php:7.4-fpm-alpine:"

docker build \
  -t carimus/laravel-alpine:$FPM_TAG_74 \
  -t carimus/laravel-alpine:$GIT_SHORT_COMMIT-$FPM_TAG_74 \
  -f ./php7.4-fpm/Dockerfile \
  .

echo

echo "Building image based on php:7.3-cli-alpine:"

docker build \
  -t carimus/laravel-alpine:$CLI_TAG_73 \
  -t carimus/laravel-alpine:$GIT_SHORT_COMMIT-$CLI_TAG_73 \
  -f ./php7.3-cli/Dockerfile \
  .

echo

echo "Building image based on php:7.3-fpm-alpine:"

docker build \
  -t carimus/laravel-alpine:$FPM_TAG_73 \
  -t carimus/laravel-alpine:$GIT_SHORT_COMMIT-$FPM_TAG_73 \
  -f ./php7.3-fpm/Dockerfile \
  .

echo

echo "Pushing images to docker hub:"

docker push carimus/laravel-alpine:$CLI_TAG_82
docker push carimus/laravel-alpine:latest
docker push carimus/laravel-alpine:$GIT_SHORT_COMMIT
docker push carimus/laravel-alpine:$GIT_SHORT_COMMIT-$CLI_TAG_82
docker push carimus/laravel-alpine:$FPM_TAG_82
docker push carimus/laravel-alpine:$GIT_SHORT_COMMIT-$FPM_TAG_82

docker push carimus/laravel-alpine:$CLI_TAG_81
docker push carimus/laravel-alpine:$GIT_SHORT_COMMIT-$CLI_TAG_81
docker push carimus/laravel-alpine:$FPM_TAG_81
docker push carimus/laravel-alpine:$GIT_SHORT_COMMIT-$FPM_TAG_81

docker push carimus/laravel-alpine:$CLI_TAG_80
docker push carimus/laravel-alpine:$GIT_SHORT_COMMIT-$CLI_TAG_80
docker push carimus/laravel-alpine:$FPM_TAG_80
docker push carimus/laravel-alpine:$GIT_SHORT_COMMIT-$FPM_TAG_80

docker push carimus/laravel-alpine:$CLI_TAG_74
docker push carimus/laravel-alpine:$GIT_SHORT_COMMIT-$CLI_TAG_74
docker push carimus/laravel-alpine:$FPM_TAG_74
docker push carimus/laravel-alpine:$GIT_SHORT_COMMIT-$FPM_TAG_74

docker push carimus/laravel-alpine:$CLI_TAG_73
docker push carimus/laravel-alpine:$GIT_SHORT_COMMIT-$CLI_TAG_73
docker push carimus/laravel-alpine:$FPM_TAG_73
docker push carimus/laravel-alpine:$GIT_SHORT_COMMIT-$FPM_TAG_73

echo

echo "Done"
