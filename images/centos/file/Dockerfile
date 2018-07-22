ARG INSTALL_VERSION
FROM centos:$INSTALL_VERSION
MAINTAINER llh

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
 && yum -y install wget \
 && mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup \
 && wget -P /etc/yum.repos.d http://mirrors.163.com/.help/CentOS7-Base-163.repo \
 && yum -y install openssh-server make which bzip2 gcc curl curl-devel crontabs net-tools \
 && yum clean all \
#不生成服务器软件包缓存，缩小镜像
#&& yum makecache
 && echo '123456' | passwd --stdin root \
 && ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N '' \
 && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' \
 && ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key -N ''

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]