FROM gethue/hue:latest

USER root

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y vim telnet

COPY z-hue-overrides.ini desktop/conf/

#USER hue
