#!/usr/bin/env bash

currentPath=$(cd `dirname $0`; pwd);
serverName='';

if [ -f "$currentPath"/server-name.conf ]
then
    serverName=`head -n 1 "$currentPath"/server-name.conf`;
fi

while true
do
    echo '--------------管理私有仓库--------------';
    echo;
    echo '1 搭建私有仓库 ';
    echo '2 镜像仓库列表 ';
    echo '3 镜像版本列表 ';
    echo '4 上传本地镜像 ';
    echo '5 下载仓库镜像 ';
    echo;
    echo 'q 返回 ';
    echo;
    read -p '请输入要进行的操作：' option

    case ${option} in
    '1')
        serverName=`curl icanhazip.com`
        read -p "请输入服务器名，不填默认为本机公网IP($serverName)：" tempServerName
        echo;

        if ! test -z ${tempServerName}
        then
            serverName=${tempServerName};
        fi

        echo "$serverName" > "$currentPath"/server-name.conf
        echo "\033[32m 启动私有仓库命令： docker-compose --file=$currentPath/../../docker-compose/registry.yml up \033[0m";
        echo "\033[32m 私有仓库地址：$serverName:5000 \033[0m";
        echo "\033[32m 如需在其他机器访问，需在那台机器的docker配置文件(linux系统为/etc/docker/daemon.json)中添加：\"insecure-registries\":[\"$serverName:5000\"] \033[0m";
        echo;
        ;;
    '2')
        registries=`curl "$serverName":5000/v2/_catalog`;
        echo;
        echo "\033[32m 镜像仓库列表： \033[0m";
        echo "\033[32m $registries \033[0m";
        echo;
        ;;
    '3')
        read -p "请输入要查询的镜像名称：" image
        tags=`curl "$serverName":5000/v2/"$image"/tags/list`;
        echo;
        echo "\033[32m 镜像版本列表： \033[0m";
        echo "\033[32m $tags \033[0m";
        echo;
        ;;
    '4')
        read -p "请输入要上传的本地镜像前缀，不填默认为空（如docker.io/liliehua/）：" prefix
        read -p "请输入要上传的本地镜像名称（如redis:4.0.10）：" image
        remoteImage="$serverName":5000/"$image"
        docker tag "$prefix$image" "$remoteImage"
        docker push "$remoteImage"
        docker rmi "$remoteImage"
        ;;
    '5')
        read -p "请输入要下载的仓库镜像名称（如redis:4.0.10）：" image
        remoteImage="$serverName":5000/"$image"
        docker pull "$remoteImage"
        docker tag "$remoteImage" "$image"
        docker rmi "$remoteImage"
        ;;
    'q')
        break;
        ;;
    esac
done
