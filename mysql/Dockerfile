# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cromalde <cromalde@student.42roma.it>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/27 16:47:00 by cromalde          #+#    #+#              #
#    Updated: 2021/03/29 11:46:30 by cromalde         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#	-*-		Dockerfile		-*-

FROM	alpine

COPY	setup.sh wordpress.sql ./

RUN		apk update && \
		apk add --no-cache mysql mysql-client

RUN		mkdir /run/mysqld

EXPOSE	3306

CMD		./setup.sh
