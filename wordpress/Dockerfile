# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cromalde <cromalde@student.42roma.it>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/28 11:13:41 by cromalde          #+#    #+#              #
#    Updated: 2021/03/29 16:45:13 by cromalde         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#	-*-		Dockerfile		-*-

FROM alpine:latest

COPY setup.sh ./

RUN apk update && \
	apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib
RUN apk add --no-cache php7-curl php7-mbstring php7-json php7-session nginx

COPY wordpress /www
COPY wp-config.php /www/

RUN mkdir -p /run/nginx && \
	chmod 755 setup.sh

COPY nginx.conf /etc/nginx/

EXPOSE 5050

CMD ./setup.sh
