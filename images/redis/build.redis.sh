#!/usr/bin/env bash

VERSION=$1

# 配置文件
curl -o ./redis-${VERSION}.tar.gz http://download.redis.io/releases/redis-${VERSION}.tar.gz
tar -zxf redis-${VERSION}.tar.gz
mv redis-${VERSION}/redis.conf ./file/redis-${VERSION}.conf

docker build --tag="my-redis:$VERSION" --build-arg="INSTALL_VERSION=$VERSION" ./file/

rm -rf ./redis*