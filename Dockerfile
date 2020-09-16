FROM alpine:3.5
ENV CONFIG_JSON=none
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && curl -L -H "Cache-Control: no-cache" -o /vty.zip https://github.com/v2ray/v2ray-core/releases/download/v4.25.0/v2ray-linux-64.zip \
 && mkdir /usr/bin/vty /etc/vty \
 && touch /etc/vty/config.json \
 && unzip /vty.zip -d /usr/bin/vty \
 && mv /usr/bin/vty/v*y /usr/bin/vty/vty \
 && rm -rf /vty.zip /usr/bin/vty/*.sig /usr/bin/vty/doc /usr/bin/vty/*.json /usr/bin/vty/*.dat /usr/bin/vty/sys* \
 && chgrp -R 0 /etc/vty \
 && chmod -R g+rwX /etc/vty
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT ["sh", "/configure.sh"]
EXPOSE 8080
