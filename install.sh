#!/usr/bin/env bash

currentPath=$(cd `dirname $0`; pwd);

while true
do
    echo '--------------Docker镜像生成工具--------------';
    echo '- 必须软件：wget                             -';
    echo '----------------------------------------------';
    echo;
    echo '1 安装自定义镜像 ';
    echo '2 安装LNMP镜像 ';
    echo;
    echo 'q 退出';
    echo;
    read -p '请输入要进行的操作：' option

    case ${option} in
    '1')
        sh "$currentPath"/shell/install/custom/install-custom.sh;
        ;;
    '2')
        sh "$currentPath"/shell/install/lnmp/install-lnmp.sh;
        ;;
    'q')
        exit;
        ;;
    esac
done
