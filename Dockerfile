FROM alpine:3.7
LABEL maintainer="Sean Cheung <theoxuanx@gmail.com>"

RUN apk add --update --no-cache mongodb su-exec \
    && mkdir -p /data/db \
    && chown -R mongodb /data/db \
    && sed -i -re "s/(^MONGODB_IP=.+)/# \1/g" /etc/conf.d/mongodb

VOLUME ["/data/db"]
EXPOSE 27017

ENTRYPOINT ["/sbin/su-exec", "mongodb"]

CMD ["mongod"]