FROM centos:centos7
MAINTAINER benoit.sauvere@teevity.com

RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7
RUN yum -y  update
RUN yum install -y wget git e4fsprogs docker

VOLUME /var/lib/docker

ADD wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

ENTRYPOINT [ "/usr/local/bin/wrapdocker" ]

CMD ["/bin/bash" , "-l"]
