FROM centos:centos7
MAINTAINER Benoît Sauvère <benoit.sauvere@gmail.com>

RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7
RUN yum -y  update
RUN yum install -y wget git e4fsprogs curl iptables

RUN yum install -y docker-1.8.2

VOLUME /var/lib/docker

ADD scripts/wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

ENTRYPOINT [ "/usr/local/bin/wrapdocker" ]
