# syntax=docker/dockerfile:1

FROM python:3

RUN mkdir -p /app/bin
RUN chmod 777 /app/bin

COPY . /app
#COPY ../bin/* /app/bin/

#RUN make /app
#CMD python3 /app/cls_py.py
