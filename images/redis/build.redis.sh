#!/usr/bin/env bash

VERSION=$1
currentPath=$(cd `dirname $0`; pwd);

# 配置文件
wget -O ./redis-${VERSION}.tar.gz http://download.redis.io/releases/redis-${VERSION}.tar.gz
tar -zxf ./redis-${VERSION}.tar.gz
mv ./redis-${VERSION}/redis.conf "$currentPath"/file/redis-${VERSION}.conf

docker build --tag="my-redis:$VERSION" --build-arg="INSTALL_VERSION=$VERSION" "$currentPath"/file/

rm -rf ./redis*