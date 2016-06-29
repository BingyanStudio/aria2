FROM alpine:3.3

RUN apk update && \
    apk add aria2 nginx && \
    mkdir -p /var/run/nginx && \
    rm -rf /var/cache/apk

ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./aria2.conf /aria2.conf
ADD ./webui /webui

ENV UID 1000
ENV GID 1000

EXPOSE 80 6800

ADD ./run.sh /
VOLUME ["/data"]

CMD ["/run.sh"]
