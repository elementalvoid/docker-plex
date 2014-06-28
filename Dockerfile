FROM ubuntu:14.04

RUN locale-gen en_US en_US.UTF-8

RUN apt-get -qq update
RUN apt-get -qqy --force-yes dist-upgrade
RUN apt-get install -qqy --force-yes wget avahi-daemon avahi-utils

ENV PLEX_VERSION 0.9.9.12.504-3e7f93c
RUN wget http://downloads.plexapp.com/plex-media-server/${PLEX_VERSION}/plexmediaserver_${PLEX_VERSION}_amd64.deb
RUN dpkg -i plexmediaserver_${PLEX_VERSION}_amd64.deb

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 32400

ENTRYPOINT ["/start.sh"]

