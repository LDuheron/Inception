#!/bin/bash
#set -eux

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initialisation de la base de données MariaDB..."
    mysql_install_db --user=mysql --ldata=/var/lib/mysql
fi

mysqld_safe --nowatch &

while ! mysqladmin ping --silent; do
    sleep 1
done

# log into MariaDB as root and create database and the user
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

echo "MariaDB start! "

exec mysqld_safe