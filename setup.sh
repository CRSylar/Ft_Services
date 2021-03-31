#! /bin/sh

# Build nginx
docker build -t ngx ./nginx/
# Build mysql
docker build -t mysql ./mysql/
# Build PhpMyAdmin
Docker build -t phpmyadmin ./phpmyadmin/
# Build Wordpress
Docker build -t wordpress ./wordpress/
# Build ftps
Docker build -t ftps ./ftps/
# Build Telegraf
Docker build -t telegraf ./telegraf/
# Build InfluxDB
Docker build -t influxdb ./influxdb/
# Build Grafana
Docker build -t grafana ./grafana/


# Deploy Web-Dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

#deploy metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl apply -f ./metallb/metallb-deployment.yaml
kubectl apply -f ./volumes/volume.yaml
kubectl apply -f ./volumes/infdb-vol.yaml

#Load Grafana Dashboards
kubectl create configmap grafana-config \
		--from-file=./grafana/dashboards/datasource.yaml \
		--from-file=./grafana/dashboards/dashboard.yaml \
		--from-file=./grafana/dashboards/nginx-dashboard.json \
		--from-file=./grafana/dashboards/mysql-dashboard.json \
		--from-file=./grafana/dashboards/phpmyadmin-dashboard.json \
		--from-file=./grafana/dashboards/wordpress-dashboard.json \
		--from-file=./grafana/dashboards/influxdb-dashboard.json \
		--from-file=./grafana/dashboards/telegraf-dashboard.json \
		--from-file=./grafana/dashboards/ftps-dashboard.json \
		--from-file=./grafana/dashboards/grafana-dashboard.json

#Deploy nginx
kubectl apply -f ./nginx/nginx-deployment.yaml
kubectl apply -f ./nginx/nginx-service.yaml

#deploy Mysql
kubectl apply -f ./mysql/mysql-deployment.yaml
kubectl apply -f ./mysql/mysql-service.yaml
kubectl apply -f ./mysql/mysql-volume-claim.yaml

#Deploy	Phpmyadmin
kubectl apply -f ./phpmyadmin/phpmad-deployment.yaml
kubectl apply -f ./phpmyadmin/phpmad-service.yaml

#Deploy	Wordpress
kubectl apply -f ./wordpress/wp-deployment.yaml
kubectl apply -f ./wordpress/wp-service.yaml

#Deploy	ftps
kubectl apply -f ./ftps/ftps-deployment.yaml
kubectl apply -f ./ftps/ftps-service.yaml

#Deploy Telegraf
kubectl apply -f ./telegraf/tele-config.yaml
kubectl apply -f ./telegraf/tele-deployment.yaml
kubectl apply -f ./telegraf/tele-service.yaml

#Deploy InfluxDB
kubectl apply -f ./influxdb/infdb-deployment.yaml
kubectl apply -f ./influxdb/infdb-service.yaml
kubectl apply -f ./influxdb/infdb-claim.yaml

#Deploy Grafana
kubectl apply -f ./grafana/grafana-deployment.yaml
kubectl apply -f ./grafana/grafana-service.yaml

kubectl apply -f ./metallb/userUI.yaml
kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") \
-o go-template="{{.data.token | base64decode}}" | pbcopy
kubectl proxy &

sleep 10s

open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default
