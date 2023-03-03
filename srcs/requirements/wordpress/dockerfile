FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get install -y \
    php-fpm \
    php-mysql \
    php-zip \
    php-redis \
    curl \
    vim && \
    sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
    #sed -i -e 's/;listen.owner = www-data/listen.owner = www-data/g' /etc/php/7.3/fpm/pool.d/www.conf && \
    #sed -i -e 's/;listen.group = www-data/listen.group = www-data/g' /etc/php/7.3/fpm/pool.d/www.conf && \
    #sed -i -e 's/;listen.mode = 0660/listen.mode = 0660/g' /etc/php/7.3/fpm/pool.d/www.conf && \
    #sed -i -e 's/;clear_env = no/clear_env = no/g' /etc/php/7.3/fpm/pool.d/www.conf && \
    #sed -i -e 's/;catch_workers_output = yes/catch_workers_output = yes/g' /etc/php/7.3/fpm/pool.d/www.conf && \
RUN apt-get install -y sendmail
RUN mkdir -p /run/php

WORKDIR /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --allow-root

COPY ./tools/script.sh .

RUN chmod +x script.sh

ENTRYPOINT ["bash", "script.sh"]
