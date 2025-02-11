FROM archlinux/archlinux:base-20250114.0.298212
RUN pacman -Sy --noconfirm apache unzip imagemagick libwmf libjxl php-apache php-sqlite php-gd php-intl python python-websockets python-trio-asyncio python-nest-asyncio
COPY httpd.conf rompr.conf /etc/httpd/conf/
RUN sed -i 's/;extension=pdo_sqlite/extension=pdo_sqlite/' /etc/php/php.ini && \
    sed -i 's/;extension=sqlite3/extension=sqlite3/' /etc/php/php.ini && \
    sed -i 's/;extension=curl/extension=curl/' /etc/php/php.ini && \
    sed -i 's/;extension=gd/extension=gd/' /etc/php/php.ini && \
    sed -i 's/;extension=intl/extension=intl/' /etc/php/php.ini
COPY run.sh /run.sh

ARG ROMPR_VERSION=2.18
ARG ZIP_FILE=rompr-$ROMPR_VERSION.zip
ARG FETCH_URL=https://github.com/fatg3erman/RompR/releases/download/$ROMPR_VERSION/$ZIP_FILE
ADD $FETCH_URL /
RUN unzip $ZIP_FILE && \
    mkdir -p /rompr/prefs /rompr/albumart && \
    chown -R root:root /rompr && \
    chown -R http:http /rompr/prefs /rompr/albumart

EXPOSE 80
ENTRYPOINT ["/run.sh"]
