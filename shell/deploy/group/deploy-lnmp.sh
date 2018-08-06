#!/usr/bin/env bash

currentDir=$(cd `dirname $0`; pwd);
baseDir="$currentDir"/../../..;

echo '--------------LNMP组合部署项目--------------';
echo;
serverName=`curl icanhazip.com`
read -p '请输入待部署的项目目录：' projectDir
read -p "请输入服务器名，不填默认为本机公网IP($serverName)：" tempServerName

if ! test -z ${tempServerName}
then
    serverName=${tempServerName};
fi

echo;
projectName=$(echo `basename "$projectDir"`);

if [ -d "$projectDir" ]
then
    targetFileName=local-"$projectName".conf
    mkdir -p "$baseDir"/_output/config/nginx/
    cp "$baseDir"/config/nginx/server.conf "$_"/"$targetFileName"
    sed -i "s/\${projectName}/${projectName}/g" "$baseDir"/_output/config/nginx/"$targetFileName"
    sed -i "s/\${serverName}/${serverName}/g" "$baseDir"/_output/config/nginx/"$targetFileName"

    cp "$baseDir"/docker-compose/lnmp.yml "$baseDir"/_output/docker-compose.yml
    sed -i "s#\${projectName}#${projectName}#g" "$baseDir"/_output/docker-compose.yml
    sed -i "s#\${projectDir}#${projectDir}#g" "$baseDir"/_output/docker-compose.yml
    sed -i "s#\${baseDir}#${baseDir}#g" "$baseDir"/_output/docker-compose.yml

    echo "127.0.0.1      $serverName" >> /etc/hosts
    echo "::1            $serverName" >> /etc/hosts

    echo -e "\033[32m 部署成功！项目访问地址：http://$serverName:666 \033[0m"
    echo "Mac系统请输入sudo vi /etc/hosts，在hosts文件中补充如下代码"
    echo "127.0.0.1      $serverName";
    echo "::1            $serverName";
else
    echo -e "\033[31m 请输入正确的项目目录！ \033[0m"
fi