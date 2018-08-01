#!/usr/bin/env bash

currentPath=$(cd `dirname $0`; pwd);
source "$currentPath"/install-version.conf

while true
do
    echo '--------------单一镜像列表--------------';
    echo;
    echo '1 CENTOS镜像';
    echo '2 NGINX镜像 ';
    echo '3 PHP镜像 ';
    echo '4 MYSQL镜像 ';
    echo '5 REDIS镜像 ';
    echo;
    echo 'q 返回 ';
    echo;
    read -p '请输入要进行的操作：' option

    case ${option} in
    '1')
         # centos版本选择
        read -p "请选择CENTOS版本，不填默认版本为（${centosVersion}）：" tempVersion

        if ! test -z ${tempVersion};then
            centosVersion=${tempVersion};
        fi

        echo "3秒后开始安装CENTOS:${centosVersion}镜像....................................";
        sleep 3;
        sh "$currentPath"/../build-dockerfile/build-centos.sh "$centosVersion"
        ;;
    '2')
        # nginx版本选择
        read -p "请选择NGINX版本，不填默认版本为（${nginxVersion}）：" tempVersion

        if ! test -z ${tempVersion};then
            nginxVersion=${tempVersion};
        fi

        echo "3秒后开始安装NGINX:${nginxVersion}镜像....................................";
        sleep 3;
        sh "$currentPath"/../build-dockerfile/build-nginx.sh "$nginxVersion"
        ;;

    '3')
         # php版本选择
        read -p "请选择PHP版本，不填默认版本为（${phpVersion}）：" tempVersion

        if ! test -z ${tempVersion};then
            phpVersion=${tempVersion};
        fi

        echo "3秒后开始安装CENTOS:7镜像....................................";
        sleep 3;
        sh "$currentPath"/../build-dockerfile/build-centos.sh 7
        echo "3秒后开始安装PHP:${phpVersion}镜像....................................";
        sleep 3;
        sh "$currentPath"/../build-dockerfile/build-php.sh "$phpVersion"
        ;;
    '4')
        # mysql版本选择
        read -p "请选择MYSQL版本，不填默认版本为（${mysqlVersion}）：" tempVersion

        if ! test -z ${tempVersion};then
            mysqlVersion=${tempVersion};
        fi

        echo "3秒后开始安装MYSQL:${mysqlVersion}镜像....................................";
        sleep 3;
        sh "$currentPath"/../build-dockerfile/build-mysql.sh "$mysqlVersion"
        ;;
    '5')
        # redis版本选择
        read -p "请选择REDIS版本，默认版本（${redisVersion}）：" tempVersion

        if ! test -z ${tempVersion};then
            redisVersion=${tempVersion};
        fi

        echo "3秒后开始安装REDIS:${redisVersion}镜像....................................";
        sleep 3;
        sh "$currentPath"/../build-dockerfile/build-redis.sh "$redisVersion"
        ;;
    'q')
        break;
        ;;
    esac
done