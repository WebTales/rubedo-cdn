FROM centos:centos7

#Install NGinx
RUN yum -y update && yum -y install epel-release
RUN yum install -y nginx

#Forward request logs to Docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN mkdir -p /usr/local/www
COPY files /usr/local/www
ADD index.html /usr/local/www/

ADD nginx.conf /etc/nginx/
EXPOSE 80 443

VOLUME /files
CMD ["nginx", "-g", "daemon off;"]
