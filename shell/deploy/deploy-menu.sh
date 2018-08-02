#!/usr/bin/env bash

currentPath=$(cd `dirname $0`; pwd);

while true
do
    echo '--------------部署方案列表--------------';
    echo;
    echo '1 LNMP组合部署项目 ';
    echo;
    echo 'q 返回 ';
    echo;
    read -p '请输入要进行的操作：' option

    case ${option} in
    '1')
        sh "$currentPath"/group/deploy-lnmp.sh;
        ;;
    'q')
        break;
        ;;
    esac
done
