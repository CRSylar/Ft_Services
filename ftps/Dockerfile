# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cromalde <cromalde@student.42roma.it>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/30 11:44:58 by cromalde          #+#    #+#              #
#    Updated: 2021/03/30 14:58:24 by cromalde         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#	-*-		Dockerfile		-*-

FROM alpine:latest

COPY setup.sh ./

RUN apk update

RUN	apk add --no-cache vsftpd openssl

RUN	adduser -D admin && \
	echo "admin:password" | chpasswd

COPY vsftpd.conf /etc/vsftpd/

RUN	echo "admin" >> /etc/vsftpd/vsftpd.userlist

RUN		openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 \
		-subj "/C=IT/L=Rome/O=42/OU=Federation/CN=localhost" \
		-keyout /etc/ssl/private/services.key -out /etc/ssl/certs/services.crt

EXPOSE 21 30000 30001 30002

CMD ./setup.sh
