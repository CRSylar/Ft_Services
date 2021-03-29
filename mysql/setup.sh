#! /bin/sh
openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
mysql wordpress < wordpress.sql

rc-service mariadb stop
/usr/bin/mysqld_safe
