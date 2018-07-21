ARG INSTALL_VERSION
FROM mysql:$INSTALL_VERSION

ENV MYSQL_ROOT_PASSWORD 123456

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY ./conf/mysql.cnf /etc/mysql/mysql.conf.d/mysql.cnf
COPY ./scripts/create_db.sh /docker-entrypoint-initdb.d/create_db.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--explicit_defaults_for_timestamp", "--disable-partition-engine-check"]
