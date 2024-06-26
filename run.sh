#!/bin/bash

dr="bin/"

if [ ! -d "$dr" ]; then
	mkdir -p bin
	s3cmd get -r s3://otus-cls/ bin
fi
docker build -t cr.yandex/crpn0ichd5bsrptua8ae/cls-img:latest .
docker push cr.yandex/crpn0ichd5bsrptua8ae/cls-img:latest
# docker run -t -dp 8080:5000 cls_proj		# запускаем контейнер в случае реализации в docker
kubectl apply -f kuber/cls-deploy.yaml
kubectl apply -f kuber/cls-service.yaml
