# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cromalde <cromalde@student.42roma.it>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/30 11:44:58 by cromalde          #+#    #+#              #
#    Updated: 2021/03/30 13:31:31 by cromalde         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#	-*-		Dockerfile		-*-

FROM	alpine:latest

RUN		apk update && \
		apk add --no-cache vsftpd openssl

COPY	vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY	start_vsftpd.sh /bin/start_vsftpd.sh

RUN		openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 \
		-subj "/C=IT/L=Rome/O=42/OU=Federation/CN=localhost" \
		-keyout /etc/ssl/private/services.key -out /etc/ssl/certs/services.crt

EXPOSE 21 21000-21010
VOLUME /ftp/ftp

STOPSIGNAL	SIGKILL

ENTRYPOINT	["/bin/start_vsftpd.sh"]
