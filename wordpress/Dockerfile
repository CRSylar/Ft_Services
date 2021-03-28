# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cromalde <cromalde@student.42roma.it>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/28 11:13:41 by cromalde          #+#    #+#              #
#    Updated: 2021/03/28 11:54:54 by cromalde         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#	-*-		Dockerfile		-*-

FROM	alpine:latest

COPY	index.html nginx.conf setup.sh /

RUN		apk update && apk add --no-cache nginx openssl wget php

RUN		mkdir www /run/nginx && \
		mv index.html /www/ && \
		mv nginx.conf /etc/nginx/

RUN		openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 \
		-subj "/C=IT/L=Rome/O=42/OU=Federation/CN=localhost" \
		-keyout /etc/ssl/private/services.key -out /etc/ssl/certs/services.crt

RUN		ssh-keygen -A && \
		adduser -D ssh_admin && \
		echo "ssh_admin:password" | chpasswd

EXPOSE	5050

CMD		./setup.sh
