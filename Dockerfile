FROM centos:centos6 
MAINTAINER <Stephen Lawrence>

RUN yum install -y git httpd php php-pdo php-mysql mysql
RUN yum update -y

EXPOSE 80

ADD files/config.php /config.php
ADD files/web-startup.sh /web-startup.sh
ADD files/opendocman.ini  /etc/php.d/

RUN chmod 700 /web-startup.sh

CMD ["/web-startup.sh"]
