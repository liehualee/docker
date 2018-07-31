ARG INSTALL_VERSION
FROM mysql:$INSTALL_VERSION
MAINTAINER llh

ENV MYSQL_ROOT_PASSWORD 123456

COPY conf/mysql.cnf /etc/mysql/mysql.conf.d/mysql.cnf
COPY scripts/initdb.sh /docker-entrypoint-initdb.d/initdb.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--explicit_defaults_for_timestamp", "--disable-partition-engine-check"]
