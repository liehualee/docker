#!/usr/bin/env bash

currentPath=$(cd `dirname $0`; pwd);

while true
do
    echo '--------------LNMP镜像向导--------------\n';
    echo '1 安装全部镜像 ';
    echo '2 自定义选择镜像 \n';
    echo 'q 退出 \n';
    read -p '请输入要进行的操作：' option

    case ${option} in
    '1')
        sh "$currentPath"/install-lnmp-all.sh;
        ;;
    '2')
        sh "$currentPath"/install-lnmp-single.sh;
        ;;
    'q')
        break;
        ;;
    esac
done