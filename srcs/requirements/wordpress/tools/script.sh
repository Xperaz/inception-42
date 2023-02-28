#!/bin/sh
apt update -y
apt install curl php-fpm php-mysql -y
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp 
sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
wp core download --path="/var/www/html"  --allow-root
chown -R www-data:www-data /var/www/html
wp config create --dbname=$database_name --dbuser=$mysql_user --dbpass=$mysql_password --dbhost=$mysql_host --path=/var/www/html --allow-root --skip-check --extra-php <<PHP
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );
define('WP_REDIS_DISABLED', false);
PHP
wp core install --url=$DOMAIN_NAME --title=$title --admin_user=$admin_user --admin_password=$admin_password --admin_email=$admin_email --allow-root --path=/var/www/html
wp user create aouhadou aouhadou1@gmail.com --user_pass=$mysql_password --role=author --allow-root --path=/var/www/html/
service php7.3-fpm start
wp plugin install redis-cache --path=/var/www/html --allow-root
wp plugin activate redis-cache --path=/var/www/html --allow-root
wp redis enable --path=/var/www/html --allow-root
service php7.3-fpm stop
php-fpm7.3 -F