FROM  debian:buster

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install apache2 -y

RUN sed -i  's/80/81/g' /etc/apache2/ports.conf

COPY ./portfolio /var/www/html

CMD ["apachectl", "-D", "FOREGROUND"]