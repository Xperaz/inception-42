#!bin/bash

# Install Wordpress
wp config create --dbname=$database_name --dbuser=$mysql_user \
    --dbpass=$mysql_password --dbhost=$mysql_host --allow-root  --skip-check

wp core install --url=$domain_name --title=$brand --admin_user=$wordpress_admin \
    --admin_password=$wordpress_admin_password --admin_email=$wordpress_admin_email \
    --allow-root

wp user create $login $wp_user_email --role=author --user_pass=$wp_user_pwd --allow-root

/usr/sbin/php-fpm7.3 -F