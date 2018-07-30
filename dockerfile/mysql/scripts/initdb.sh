#!/usr/bin/env bash

mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "
create database if not exists auto_create_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

grant SELECT,INSERT,UPDATE,EXECUTE,DELETE,ALTER on auto_create_db.* to auto_create_user@'%' identified by '123456';
grant SELECT,INSERT,UPDATE,EXECUTE,DELETE,ALTER,CREATE,DROP,INDEX on auto_create_db.* to super_auto_create_user@'%' identified by '123456';

FLUSH PRIVILEGES;"
