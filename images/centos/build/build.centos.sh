#!/usr/bin/env bash

VERSION=$1

docker build --tag="my-centos:$VERSION" --build-arg="INSTALL_VERSION=$VERSION" ../../centos
