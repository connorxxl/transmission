FROM ubuntu:trusty

MAINTAINER connorxxl <christian.flaig@gmail.com>

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:transmissionbt/ppa && \
    apt-get update && \
    apt-get install -y transmission-daemon && \
    apt-get -y autoremove && \
    apt-get -y clean

RUN mkdir /config && \
  mkdir /volumes/complete && \
  mkdir /volumes/incomplete && \
  mkdir /volumes/watch

EXPOSE 9091 51414/tcp 51414/udp

VOLUME ["/config"]
VOLUME ["/volumes/complete"]
VOLUME ["/volumes/incomplete"]
VOLUME ["/volumes/watch"]

ENV TRANSMISSION_HOME /config

ENTRYPOINT ["/usr/bin/transmission-daemon"]
#CMD [ "--allowed", "0.0.0.0", "--encryption-preferred", "--foreground", "--dht", "--no-auth", "--config-dir", "$TRANSMISSION_HOME", "--watch-dir", "/volumes/watch", "--incomplete-dir", "/volumes/incomplete", "--download-dir", "/volumes/complete" ]
CMD [ "--allowed", "0.0.0.0", "--encryption-preferred", "--foreground", "--dht", "--no-auth", "--config-dir", "$TRANSMISSION_HOME" ]
