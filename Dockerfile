FROM alpine:3.4

RUN apk -U add \
    python \
    python3 \
    perl \
    make \
    && apk -U add --virtual deps \
    py-pip \
    && pip install pelican markdown \
    && apk del deps \
    && rm -rf /var/cache/apk/*

COPY start.sh start.sh
RUN chmod +x start.sh
EXPOSE 4000

CMD ["/bin/sh", "start.sh"]
