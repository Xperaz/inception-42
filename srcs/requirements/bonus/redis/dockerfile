FROM debian:buster

RUN apt-get update -y && \
    apt-get install -y redis && \
    apt-get install -y redis-server

RUN sed -i 's/# bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf
RUN echo 'maxmemory 256mb' >> /etc/redis/redis.conf && \ 
   echo 'maxmemory-policy allkeys-lru' >> /etc/redis/redis.conf


RUN echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf

EXPOSE 6379

CMD ["redis-server", "--protected-mode", "no"]