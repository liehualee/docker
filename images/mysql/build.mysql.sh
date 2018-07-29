#!/usr/bin/env bash

VERSION=$1
currentPath=$(cd `dirname $0`; pwd);

docker build --tag="my-mysql:$VERSION" --build-arg="INSTALL_VERSION=$VERSION" "$currentPath"/file/
