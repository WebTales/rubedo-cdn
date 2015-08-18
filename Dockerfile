FROM centos:centos7

MAINTAINER NGINX Docker Maintainers "docker-maint@nginx.com"
RUN yum -y update && yum -y install epel-release
RUN yum install -y nginx

# forward request logs to Docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log


RUN mkdir -p /usr/local/www/cache
ADD nginx.conf /etc/nginx/
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]