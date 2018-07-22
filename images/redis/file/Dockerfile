ARG INSTALL_VERSION
FROM redis:$INSTALL_VERSION
MAINTAINER llh

ARG INSTALL_VERSION
COPY redis-$INSTALL_VERSION.conf /etc/redis/redis.conf
# 启动配置修改
RUN sed -i 's/^bind\s*127\.0\.0\.1/# bind 127.0.0.1/' /etc/redis/redis.conf \
 && sed -i 's#^dir\s*\./#dir /data#' /etc/redis/redis.conf \
 && sed -i 's/#\s*maxmemory-policy\s*noeviction/maxmemory-policy allkeys-lru/' /etc/redis/redis.conf \
 && sed -i 's/#\s*requirepass\s*foobared/requirepass 123456/' /etc/redis/redis.conf

CMD ["/etc/redis/redis.conf"]