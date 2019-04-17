#!/bin/sh
# Fix permissions and start squid service

echo "Changing owner/group to $PUID and $PGID and fixing permissions..."
OLDUID=`id -u squid`
OLDGID=`id -g squid`
usermod -u $PUID squid
groupmod -g $PGID squid
find / -user $OLDUID -exec chown -h squid {} \;
find / -group $OLDGID -exec chgrp -h squid {} \;

if [ ! -f /etc/squid/squid.conf ]; then
    echo "Copying default configuration files into volume /etc/squid."
    cp -pr /defaults/squid.defaults/* /etc/squid
else
    echo "Configuration file found in /etc/squid."
fi    

# Initialise cache
/usr/sbin/squid -Nz

echo "Executing /usr/sbin/squid $SQUIDARGS"
exec /usr/sbin/squid $SQUIDARGS
