#!/usr/bin/env bash

currentPath=$(cd `dirname $0`; pwd);

while true
do
    echo '--------------Docker辅助工具------------------';
    echo '- 必须软件：wget                             -';
    echo '----------------------------------------------';
    echo;
    echo '1 安装单一镜像 ';
    echo '2 安装组合镜像 ';
    echo '3 一键部署项目 ';
    echo;
    echo 'q 退出';
    echo;
    read -p '请输入要进行的操作：' option

    case ${option} in
    '1')
        sh "$currentPath"/shell/install/install-single.sh;
        ;;
    '2')
        sh "$currentPath"/shell/install/install-group.sh;
        ;;
    '3')
        sh "$currentPath"/shell/deploy/deploy-menu.sh;
        ;;
    'q')
        exit;
        ;;
    esac
done
