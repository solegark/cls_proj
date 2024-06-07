# syntax=docker/dockerfile:1

FROM ubuntu:22.04


apt install s3cmd

COPY . /app
COPY ../bin/* /app/bin/

RUN make /app
CMD python3 /app/cls_py.py
