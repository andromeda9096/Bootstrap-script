#!/bin/bash

sudo apt-get update -y

sudo apt install mysql-server -y
sudo service mysql start

export REMOTE_USER=admin
export REMOTE_PW=Abcd@2468
sudo mysql -e "CREATE DATABASE mysite;"

sudo mysql -e "CREATE USER '$REMOTE_USER' IDENTIFIED BY '$REMOTE_PW'"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$REMOTE_USER' WITH GRANT OPTION;"
sudo sed -i -E 's/^bind-address[\t ]*= 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf

sudo service mysql restart

