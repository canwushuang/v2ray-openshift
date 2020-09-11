FROM alpine:3.5
ENV CONFIG_JSON=none
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && curl -L -H "Cache-Control: no-cache" -o /vty.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
 && mkdir /usr/bin/vty /etc/vty \
 && touch /etc/vty/config.json \
 && unzip /vty.zip -d /usr/bin/vty \
 && rm -rf /vty.zip /usr/bin/v2ray/*.sig /usr/bin/vty/doc /usr/bin/v2ray/*.json /usr/bin/vty/*.dat /usr/bin/vty/sys* \
 && chgrp -R 0 /etc/vty \
 && chmod -R g+rwX /etc/vty
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT ["sh", "/configure.sh"]
EXPOSE 8080
