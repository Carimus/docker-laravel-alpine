#!/usr/bin/env bash

set -e

GIT_STATUS="$(git status -s)"
GIT_SHORT_COMMIT="$(git rev-parse --short HEAD)"

REPO_NAME="carimus/laravel-alpine"
CLI_TAG="php7.3-cli"
FPM_TAG="php7.3-fpm"

if [[ -n "$GIT_STATUS" ]]; then
  echo "There are untracked changes or the working tree is dirty."
  echo "The image is tagged with the short git commit so please commit any changes before publishing."
  exit 1
fi

echo "Will build images with the following tags:"
echo -e "Based on php:7.3-cli-alpine:\t$CLI_TAG, latest, $GIT_SHORT_COMMIT, $GIT_SHORT_COMMIT-$CLI_TAG"
echo -e "Based on php:7.3-fpm-alpine:\t$FPM_TAG, $GIT_SHORT_COMMIT-$FPM_TAG"
echo

echo "Building image based on php:7.3-cli-alpine (default image):"

docker build \
  -t carimus/laravel-alpine:$CLI_TAG \
  -t carimus/laravel-alpine:latest \
  -t carimus/laravel-alpine:$GIT_SHORT_COMMIT \
  -t carimus/laravel-alpine:$GIT_SHORT_COMMIT-$CLI_TAG \
  -f ./php7.3-cli/Dockerfile \
  .

echo

echo "Building image based on php:7.3-fpm-alpine:"

docker build \
  -t carimus/laravel-alpine:$FPM_TAG \
  -t carimus/laravel-alpine:$GIT_SHORT_COMMIT-$FPM_TAG \
  -f ./php7.3-fpm/Dockerfile \
  .

echo

echo "Pushing images to docker hub:"

docker push carimus/laravel-alpine:$CLI_TAG
docker push carimus/laravel-alpine:latest
docker push carimus/laravel-alpine:$GIT_SHORT_COMMIT
docker push carimus/laravel-alpine:$GIT_SHORT_COMMIT-$CLI_TAG
docker push carimus/laravel-alpine:$FPM_TAG
docker push carimus/laravel-alpine:$GIT_SHORT_COMMIT-$FPM_TAG

echo

echo "Done"
