#!/bin/bash

if [ ! -f /var/www/html/config.php ]
then
	git clone https://github.com/opendocman/opendocman.git --branch master /var/www/html
	chown -R www-data:www-data /var/www/html && chmod 777 /var/www/html/templates_c
	touch  /var/log/php_errors.log && chown www-data:www-data  /var/log/php_errors.log
	mv /config.php /var/www/html/
	mysql -u opendocman --password=opendocman --host=db opendocman < /var/www/html/database.sql
fi

/usr/sbin/apache2ctl -D FOREGROUND
