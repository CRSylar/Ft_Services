# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cromalde <cromalde@student.42roma.it>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/27 16:47:00 by cromalde          #+#    #+#              #
#    Updated: 2021/03/29 16:49:55 by cromalde         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#	-*-		Dockerfile		-*-

FROM	alpine

COPY	setup.sh wordpress.sql my.cnf ./

RUN		apk update && \
		apk add --no-cache mysql mysql-client openrc

RUN		mv my.cnf ./etc/mysql/

RUN		mkdir /run/mysqld

EXPOSE	3306

CMD		./setup.sh
