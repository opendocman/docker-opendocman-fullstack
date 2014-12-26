FROM php:5.4-apache
MAINTAINER <Stephen Lawrence>

# Install packages
RUN apt-get update && \
apt-get install -y apt-utils vim mysql-client php5-mysql git

RUN git clone https://github.com/opendocman/opendocman.git --branch master /var/www/html
RUN chown -R www-data:www-data /var/www/html && chmod 777 /var/www/html/templates_c
RUN touch  /var/log/php_errors.log && chown www-data:www-data  /var/log/php_errors.log
RUN mysql -u root --password=rootpass --host=db opendocman < /var/www/html/database.sql

# PHP prod config
ADD files/php.ini /usr/local/lib/php.ini
ADD files/config.php /var/www/html/


EXPOSE 80

# By default, simply start apache.
CMD ["/usr/sbin/apache2ctl","-D FOREGROUND"]
