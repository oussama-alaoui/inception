#!/bin/bash

# change the listen in fpm pool conf to 9000
# cat /etc/php/7.0/fpm/pool.d/www.conf;
# sed -i "s/listen = .*/listen = 9000/" /etc/php/7.0/fpm/pool.d/www.conf;

# cat /etc/php/7.0/fpm/pool.d/www.conf;
echo "Starting PHP-FPM 7.0"
exec "$@"