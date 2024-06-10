# syntax=docker/dockerfile:1

FROM ubuntu:22.04

RUN mkdir -p /app/bin
RUN chmod 777 /app/bin

COPY . /app
#COPY ../bin/* /app/bin/

#RUN make /app
#CMD python3 /app/cls_py.py
