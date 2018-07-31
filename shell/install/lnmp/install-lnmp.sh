#!/usr/bin/env bash

currentPath=$(cd `dirname $0`; pwd);
nginxVersion=1.14.0
phpVersion=7.1.11
mysqlVersion=5.7.18
redisVersion=4.0.10

while true
do
    echo '-------------------选择LNMP版本-------------------';
    echo;

    # nginx版本选择
    read -p "请选择NGINX版本，不填默认版本为（${nginxVersion}）：" tempVersion
    if ! test -z ${tempVersion};then
        nginxVersion=${tempVersion};
    fi

    # php版本选择
    read -p "请选择PHP版本，不填默认版本为（${phpVersion}）：" tempVersion

    if ! test -z ${tempVersion};then
        phpVersion=${tempVersion};
    fi

    # mysql版本选择
    read -p "请选择MYSQL版本，不填默认版本为（${mysqlVersion}）：" tempVersion

    if ! test -z ${tempVersion};then
        mysqlVersion=${tempVersion};
    fi

    # redis版本选择
    read -p "请选择REDIS版本，默认版本（${redisVersion}）：" tempVersion

    if ! test -z ${tempVersion};then
        redisVersion=${tempVersion};
    fi

    echo;
    echo "您当前选择的版本为：NGINX(${nginxVersion}),PHP(${phpVersion}),MYSQL(${mysqlVersion}),REDIS(${redisVersion}) ";
    echo;
    read -p "请确认版本信息，继续安装请输入y，重新选择请按任意键：" confirm;
    if [ "$confirm" = "y" ];then
        break;
    fi
done

echo;
echo "3秒后开始安装CENTOS:7镜像....................................";
sleep 3;
sh "$currentPath"/../../build-dockerfile/build.centos.sh 7

echo;
echo "3秒后开始安装NGINX:${nginxVersion}镜像....................................";
sleep 3;
sh "$currentPath"/../../build-dockerfile/build.nginx.sh "$nginxVersion"

echo;
echo "3秒后开始安装PHP:${phpVersion}镜像....................................";
sleep 3;
sh "$currentPath"/../../build-dockerfile/build.php.sh "$phpVersion"

echo;
echo "3秒后开始安装MYSQL:${mysqlVersion}镜像....................................";
sleep 3;
sh "$currentPath"/../../build-dockerfile/build.mysql.sh "$mysqlVersion"

echo;
echo "3秒后开始安装REDIS:${redisVersion}镜像....................................";
sleep 3;
sh "$currentPath"/../../build-dockerfile/build.redis.sh "$redisVersion"

echo;
echo "安装完成，如有失败，请重新安装！！";

