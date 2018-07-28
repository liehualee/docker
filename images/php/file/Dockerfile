ARG SYSTEM_VERSION
FROM my-centos:$SYSTEM_VERSION
MAINTAINER llh

ARG INSTALL_PHP_VERSION

# 基础软件
RUN yum -y install \
    gcc gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel \
    freetype freetype-devel libpng libpng-devel libxml2 libxml2-devel \
    zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel \
    ncurses curl openssl-devel gdbm-devel db4-devel libXpm-devel \
    libX11-devel gd-devel gmp-devel readline-devel libxslt-devel \
    expat-devel xmlrpc-c xmlrpc-c-devel ImageMagick ImageMagick-devel \
 && yum clean all

# 安装加密扩展库
RUN wget https://svwh.dl.sourceforge.net/project/mcrypt/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.gz \
 && tar zxf libmcrypt-2.5.8.tar.gz \
 && cd libmcrypt-2.5.8 \
 && ./configure --disable-posix-threads --with-prefix=/usr/local \
 && make \
 && make install \
 && cd - \
 && rm -rf libmcrypt-2.5.8*

# 安装php
COPY ./php.ini /root/php.ini
RUN wget "http://cn2.php.net/distributions/php-$INSTALL_PHP_VERSION.tar.gz" \
 && tar zxf "php-$INSTALL_PHP_VERSION.tar.gz" \
 && cd "php-$INSTALL_PHP_VERSION" \
 && ./configure \
    --prefix=/usr/local/php --enable-opcache --enable-fpm \
    --enable-soap --with-libxml-dir --with-xmlrpc \
    --with-openssl --with-mcrypt --with-mhash \
    --with-pcre-regex --with-sqlite3 --with-zlib \
    --enable-bcmath --with-iconv --with-bz2 \
    --enable-calendar --with-curl \
    --with-cdb --enable-dom --enable-exif \
    --enable-fileinfo --enable-filter --with-pcre-dir \
    --enable-ftp --with-gd --with-openssl-dir \
    --with-jpeg-dir --with-png-dir --with-zlib-dir  \
    --with-freetype-dir --enable-gd-native-ttf \
    --enable-gd-jis-conv --with-gettext --with-gmp \
    --with-mhash --enable-json --enable-mbstring \
    --disable-mbregex --disable-mbregex-backtrack \
    --with-libmbfl --with-onig --enable-pdo \
    --with-pdo-mysql --with-zlib-dir --with-pdo-sqlite \
    --with-readline --enable-session --enable-shmop \
    --enable-simplexml --enable-sockets --enable-sysvmsg \
    --enable-sysvsem --enable-sysvshm --enable-wddx \
    --with-libxml-dir  --with-xsl --enable-zip \
    --enable-mysqlnd-compression-support --with-pear \
 && make \
 && make install \
# php.ini配置文件处理
 && cd - \
 && cp "php-$INSTALL_PHP_VERSION/php.ini-production" /usr/local/php/lib/php.ini \
 && cat /root/php.ini >> /usr/local/php/lib/php.ini \
# php软链接
 && ln -fs /usr/local/php/bin/php /usr/bin/ \
 && rm -rf php-$INSTALL_PHP_VERSION*

# php-fpm 配置文件处理
RUN cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf \
 && cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf \
 && sed -i 's/listen\s*=\s*127\.0\.0\.1\:9000/listen = [::]:9000/' /usr/local/php/etc/php-fpm.d/www.conf

# 安装imagick (调用ImageMagick)
# 参考：http://pecl.php.net/package/imagick
RUN wget http://104.236.228.160/get/imagick-3.4.3.tgz \
 && tar zxf imagick-3.4.3.tgz \
 && cd imagick-3.4.3 \
 && /usr/local/php/bin/phpize \
 && ./configure --with-php-config=/usr/local/php/bin/php-config \
 && make \
 && make install \
 && cd - \
 && rm -rf imagick-3.4.3*

CMD /usr/local/php/sbin/php-fpm --nodaemonize
