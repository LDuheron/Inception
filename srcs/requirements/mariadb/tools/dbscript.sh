#!/bin/bash
#set -eux

service MariaDB start;

# log into MariaDB as root and create database and the user
MariaDB -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
MariaDB -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
MariaDB -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
MariaDB -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
MariaDB -e "FLUSH PRIVILEGES;"

MariaDBadmin -u root -p${SQL_ROOT_PASSWORD} shutdown
#mysqladmin -u root shutdown
exec mysqld_safe

#print status
echo "MariaDB database and user were created successfully! "