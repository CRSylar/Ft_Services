# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cromalde <cromalde@student.42roma.it>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/31 11:54:08 by cromalde          #+#    #+#              #
#    Updated: 2021/03/31 12:31:59 by cromalde         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN		apk update && \
		apk add --no-cache wget

RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.5-static_linux_amd64.tar.gz && \
		tar xf telegraf-1.14.5-static_linux_amd64.tar.gz && \
		rm -rf telegraf-1.14.5-static_linux_amd64.tar.gz

RUN		cp telegraf/telegraf /usr/bin/

EXPOSE	8125

CMD		["telegraf", "--config", "etc/telegraf/telegraf.conf"]
