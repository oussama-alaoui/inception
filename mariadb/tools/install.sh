#!/bin/bash
sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
DB_NAME="test123"
DB_PSSWRD="1234"
DB_USER="oalaoui"
MYSQL_ROOT_PASSWORD="1234"
service mysql start
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME";
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PSSWRD'" ;
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';" ;
mysql -e "FLUSH PRIVILEGES;"
mysql -e "alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';" ;
mysql -e "FLUSH PRIVILEGES;"
kill `cat /var/run/mysqld/mysqld.pid`

exec "$@"