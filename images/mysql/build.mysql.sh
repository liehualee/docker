#!/usr/bin/env bash

VERSION=$1

docker build --tag="my-mysql:$VERSION" --build-arg="INSTALL_VERSION=$VERSION" ./file/
