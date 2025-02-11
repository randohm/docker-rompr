#!/bin/sh

/bin/chown -R http:http /rompr/prefs /rompr/albumart
/usr/sbin/httpd -DFOREGROUND
