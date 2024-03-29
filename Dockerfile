# syntax=docker/dockerfile:1

FROM alpine

ENV PUID=0
ENV PGID=0

COPY scripts/start.sh /

RUN apk -U --no-cache upgrade
RUN apk -U --no-cache add dnsmasq
RUN rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

RUN mkdir /config
RUN chmod -R 777 /start.sh /config

RUN rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# ports and volumes
EXPOSE 53 53/udp
VOLUME /config

CMD ["/start.sh"]