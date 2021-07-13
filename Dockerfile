FROM alpine:3.13.5
RUN apk add apache2 apache2-utils php7-apache2 php7-sqlite3 php7-json php7-pdo php7-pdo_sqlite php7-curl php7-gd php7-mbstring imagemagick php7-xml php7-simplexml php7-session php7-mysqli php7-pdo_mysql php7-dom php7-fileinfo
COPY rompr.conf /etc/apache2/conf.d
COPY run.sh /run.sh

ARG ROMPR_VERSION=1.58
ARG ZIP_FILE=rompr-$ROMPR_VERSION.zip
ARG FETCH_URL=https://github.com/fatg3erman/RompR/releases/download/$ROMPR_VERSION/$ZIP_FILE
ADD $FETCH_URL /
RUN unzip $ZIP_FILE && \
    mkdir -p /rompr/prefs /rompr/albumart && \
    chown -R root:root /rompr && \
    chown apache:apache /rompr/prefs /rompr/albumart

EXPOSE 80
ENTRYPOINT ["/run.sh"]
