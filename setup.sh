#! /bin/sh

# Build nginx
docker build -t ngx ./nginx/
# Build mysql
docker build -t mysql ./mysql/
# Build PhpMyAdmin
Docker build -t phpmyadmin ./phpmyadmin/
# Build Wordpress
Docker build -t wordpress ./wordpress/

# Deploy Web-Dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

#deploy metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl apply -f ./metallb/metallb-deployment.yaml
#kubectl apply -f ./volume.yaml

#Deploy nginx
kubectl apply -f ./nginx/nginx-deployment.yaml
kubectl apply -f ./nginx/nginx-service.yaml

#deploy Mysql
kubectl apply -f ./mysql/mysql-deployment.yaml
kubectl apply -f ./mysql/mysql-service.yaml
#kubectl apply -f ./mysql/mysql-volume-claim.yaml

#Deploy	Phpmyadmin
kubectl apply -f ./phpmyadmin/phpmad-deployment.yaml
kubectl apply -f ./phpmyadmin/phpmad-service.yaml

#Deploy	Wordpress
kubectl apply -f ./wordpress/wp-deployment.yaml
kubectl apply -f ./wordpress/wp-service.yaml
#kubectl apply -f ./wordpress/wp-claim.yaml
