#!/bin/sh

/bin/chown apache:apache /rompr/prefs /rompr/albumart
/usr/sbin/httpd -DFOREGROUND
