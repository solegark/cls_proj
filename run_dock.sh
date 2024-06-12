#!/bin/bash

if [! -d "bin"]; then
	mkdir bin
	s3cmd get -r s3://otus-cls/ bin
fi

docker build -t cls_proj:latest .
docker run -t -dp 5000:8080 cls_proj
