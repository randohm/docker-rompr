FROM alpine:3.11.3
ADD rompr-1.40.tgz /
RUN apk add apache2 apache2-utils php7-apache2 php7-sqlite3 php7-json php7-pdo php7-pdo_sqlite php7-curl php7-gd php7-mbstring imagemagick php7-xml php7-simplexml php7-session && \
    mkdir /rompr/prefs /rompr/albumart && \
    chown apache:apache /rompr/prefs /rompr/albumart
COPY rompr.conf /etc/apache2/conf.d
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]