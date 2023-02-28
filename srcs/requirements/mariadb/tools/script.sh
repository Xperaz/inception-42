#!/bin/bash

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS ${database_name};"
mysql -e "CREATE USER '${mysql_user}'@'%' IDENTIFIED BY '${mysql_password}';"
mysql -e "GRANT ALL PRIVILEGES ON ${database_name}.* TO '${mysql_user}'@'%';"
mysql -u${mysql_root_user} -p${mysql_root_password} -e "ALTER USER '${mysql_root_user}'@'localhost' IDENTIFIED BY '${mysql_root_password}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u${mysql_root_user} -p${mysql_root_password} shutdown

exec "$@"








