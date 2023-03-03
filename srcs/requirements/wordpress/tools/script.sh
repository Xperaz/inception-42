#!bin/bash

# wait for mysql to start
sleep 10
# Install Wordpress

if [ ! -f /var/www/html/wp-config.php ]; then
    wp config create --dbname=$database_name --dbuser=$mysql_user \
        --dbpass=$mysql_password --dbhost=$mysql_host --allow-root  --skip-check

    wp core install --url=$domain_name --title=$brand --admin_user=$wordpress_admin \
        --admin_password=$wordpress_admin_password --admin_email=$wordpress_admin_email \
        --allow-root

    wp user create $login $wp_user_email --role=author --user_pass=$wp_user_pwd --allow-root

 #   wp config  set WP_DEBUG true  --allow-root

    wp config  set WP_REDIS_HOST $redis_host --allow-root

    wp config set WP_REDIS_PORT $redis_port --allow-root

    wp config  set WP_CACHE 'true' --allow-root

    wp plugin install redis-cache --allow-root

    wp plugin activate redis-cache --allow-root

    wp redis enable --allow-root
fi


/usr/sbin/php-fpm7.3 -F