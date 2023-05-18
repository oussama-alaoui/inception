FROM debian:buster

# Install packages
RUN apt-get update && apt-get install -y \
    php7.3 \
    php-fpm\
    php7.3-mysqli \
    wget 

# Copy files
COPY ./tools/script.sh ./var/www/script.sh

# Run script
RUN chmod +x ./var/www/script.sh

ENTRYPOINT [ "./var/www/script.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]