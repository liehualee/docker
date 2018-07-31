#!/usr/bin/env bash

currentPath=$(cd `dirname $0`; pwd);

while true
do
    echo '--------------组合镜像列表--------------';
    echo;
    echo '1 安装LNMP镜像 ';
    echo;
    echo 'q 返回 ';
    echo;
    read -p '请输入要进行的操作：' option

    case ${option} in
    '1')
        sh "$currentPath"/group/install-lnmp.sh;
        ;;
    'q')
        break;
        ;;
    esac
done