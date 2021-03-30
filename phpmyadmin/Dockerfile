# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cromalde <cromalde@student.42roma.it>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/28 12:50:48 by cromalde          #+#    #+#              #
#    Updated: 2021/03/30 10:49:01 by cromalde         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#		-*- Dockerfile		-*-

FROM	alpine:latest

COPY	setup.sh config.inc.php nginx.conf ./

RUN		apk update
RUN		apk add --no-cache wget nginx php7 php7-fpm php7-opcache php7-gd
RUN		apk add --no-cache php7-mysqli php7-zlib php7-curl php7-mbstring
RUN		apk add --no-cache php7-json php7-session php7-xml php7-iconv

RUN		mkdir -p /run/nginx
RUN		wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz
RUN		tar xzf phpMyAdmin-5.1.0-all-languages.tar.gz
RUN		rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz
RUN		mv phpMyAdmin-5.1.0-all-languages/ var/www/phpmyadmin
RUN		mv nginx.conf etc/nginx/nginx.conf
RUN		mv config.inc.php /var/www/phpmyadmin/

EXPOSE	5000

CMD		./setup.sh
