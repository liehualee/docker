ARG INSTALL_VERSION
FROM mysql:$INSTALL_VERSION
MAINTAINER llh

ENV MYSQL_ROOT_PASSWORD 123456

COPY conf /etc/mysql/mysql.conf.d/mysql.cnf
COPY scripts /docker-entrypoint-initdb.d/initdb.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--explicit_defaults_for_timestamp", "--disable-partition-engine-check"]
