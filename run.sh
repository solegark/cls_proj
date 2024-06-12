#!/bin/bash

dr="bin/"

if [ ! -d "$dr" ]; then
	mkdir -p bin
	s3cmd get -r s3://otus-cls/ bin
fi
docker build -t cls_proj:latest .
docker run -t -dp 8080:5000 cls_proj
