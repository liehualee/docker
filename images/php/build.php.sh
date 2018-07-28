#!/usr/bin/env bash

PHP_VERSION=$1
SYSTEM_VERSION=7

docker build \
    --tag="my-php:$PHP_VERSION" \
    --build-arg="INSTALL_PHP_VERSION=$PHP_VERSION" \
    --build-arg="SYSTEM_VERSION=$SYSTEM_VERSION" \
    ./file/
