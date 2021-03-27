#! /bin/sh

# Build nginx
docker build -t ngx ./nginx/
# Build mysql
docker build -t mysql ./mysql/
# Build Wordpress

#deploy metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl apply -f ./metallb/metallb-deployment.yaml

#Deploy nginx
kubectl apply -f ./nginx/nginx-deployment.yaml
kubectl apply -f ./nginx/nginx-service.yaml

#deploy Mysql
kubectl apply -f ./mysql/mysql-deployment.yaml
kubectl apply -f ./mysql/mysql-service.yaml
kubectl apply -f ./mysql/mysql-volume.yaml

#Deploy	Phpmyadmin

#Deploy	Wordpress

