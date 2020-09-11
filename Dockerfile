FROM alpine:3.12.0
RUN apk add apache2 apache2-utils php7-apache2 php7-sqlite3 php7-json php7-pdo php7-pdo_sqlite php7-curl php7-gd php7-mbstring imagemagick php7-xml php7-simplexml php7-session php7-mysqli php7-pdo_mysql
COPY rompr.conf /etc/apache2/conf.d
COPY run.sh /run.sh
ADD rompr.tgz /
RUN mkdir /rompr/prefs /rompr/albumart && \
    chown -R root:root /rompr && \
    chown apache:apache /rompr/prefs /rompr/albumart
EXPOSE 80
ENTRYPOINT ["/run.sh"]
