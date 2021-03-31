# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cromalde <cromalde@student.42roma.it>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/30 17:45:26 by cromalde          #+#    #+#              #
#    Updated: 2021/03/31 17:03:24 by cromalde         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#		-*-		Dockerfile		-*-

FROM	alpine:latest

RUN		apk update && \
		apk add --no-cache libc6-compat wget

RUN		mkdir /var/lib/grafana && \
		wget https://dl.grafana.com/oss/release/grafana-7.5.2.linux-amd64.tar.gz && \
		tar -zxvf grafana-7.5.2.linux-amd64.tar.gz && \
		mv grafana-7.5.2/* /var/lib/grafana/

RUN		mkdir -p /var/lib/grafana/dashboards /var/lib/grafana/data /var/lib/grafana/logs /var/lib/grafana/plugins

RUN		mv /var/lib/grafana/bin/* usr/bin/


CMD		["grafana-server", "--homepath=/var/lib/grafana"]
