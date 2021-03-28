#! /bin/sh

php-fpm7 -R
nginx -g "daemon off;"
