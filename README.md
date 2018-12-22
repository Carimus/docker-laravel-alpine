# `docker-laravel-alpine`

A docker image based on the official PHP alpine images with PHP extensions
and tools installed to be ready to run laravel web servers or workers.

## Packages

### `apk`

 - `git`
 - `bash`

### PHP Extensions

 - `phpredis`
 - `pdo_mysql`
 - `mysqli`
 - `opcache`
 - `redis`
 - `pcntl`

### Other

 - `composer`
 - `wait-for-it`

## Updates

The general workflow is as such:

 1. Update the [`Dockerfile.template`](./Dockerfile.template) as necessary.
 2. Run [`update.sh`](./update.sh) to update the PHP-type-specific `Dockerfile`s.
 3. Build and test locally (e.g. `docker build -t carimus/laravel-alpine/test:php7.2-cli -f ./php7.2-cli/Dockerfile .`)
 4. Add and commit the changes
 5. Run [`publish.sh`](./publish.sh) to build all images and push them up to docker hub. This will
    overwrite existing images there so be sure the images are backwards compatible.
