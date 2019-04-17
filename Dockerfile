FROM alpine:latest

RUN apk add --no-cache --purge -uU squid shadow \
 && mkdir -p /defaults/squid.defaults \
 && cp -pr /etc/squid/* /defaults/squid.defaults
ADD startup.sh /usr/local/bin

ENV PUID=1001
ENV PGID=1001
ENV SQUIDARGS="-NYCd 5"
EXPOSE 3128
VOLUME /etc/squid /var/cache/squid /var/log/squid

CMD ["/usr/local/bin/startup.sh"]

