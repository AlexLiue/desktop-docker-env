FROM ubuntu:20.04

MAINTAINER "pcliu"

WORKDIR /opt

ADD . /opt

RUN ["sh", "/opt/install.sh"]

ENTRYPOINT ["./entrypoint.sh"]