#!/bin/bash
sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME"
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PSSWRD'"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%'"
mysql -e "FLUSH PRIVILEGES"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'"
mysql -e "FLUSH PRIVILEGES"
#  service mysql stop
kill `cat /var/run/mysqld/mysqld.pid`

exec "$@"