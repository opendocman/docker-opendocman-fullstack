#!/bin/bash
#
#web-startup.sh - OpenDocMan init script for fig up
#Copyright (C) 2015 Stephen Lawrence Jr.
#
#This program is free software; you can redistribute it and/or
#modify it under the terms of the GNU General Public License
#as published by the Free Software Foundation; either version 2
#of the License, or (at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program; if not, write to the Free Software
#Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
#

# Fix up permissions and other stuff
chown -R apache:apache /var/www/html && chown -R apache:apache /var/www/document_repository && chmod 777 /var/www/html/templates_c
touch  /var/log/php_errors.log && chown apache:apache  /var/log/php_errors.log

# Lets get the code and the config in there if its missing
if [ ! -f /var/www/html/config.php ]
then
	git clone https://github.com/opendocman/opendocman.git --branch master /var/www/html
	mv /config.php /var/www/html/
fi

TABLES_EXIST=$(mysql -u$DB_USER -p$DB_PASS -h$DB_HOST -P$DB_PORT $DB_NAME -e "SHOW TABLES LIKE 'odm_settings'" | grep "odm_settings" > /dev/null; echo "$?")

# If the tables are not there, lets go ahead and import the default installation data
if [[ TABLES_EXIST -eq 1 ]]; then
	mysql -u $DB_USER --password=$DB_PASS --host=$DB_HOST -P$DB_PORT $DB_NAME < /var/www/html/database.sql
fi

# Since this container doesn't know its own external IP address, lets null this base_url
mysql -u $DB_USER --password=$DB_PASS --host=$DB_HOST -P$DB_PORT $DB_NAME -e "UPDATE odm_settings SET value='' WHERE name='base_url'"

/usr/sbin/apachectl -D FOREGROUND
