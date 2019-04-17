# docker-squid

A small [squid](http://www.squid-cache.org/) container based on Alipine.

* Copies default config to mounted volume
* Set PUID, PGID to desired uid, gid
* Set SQUIDARGS to startup arguments.

Default configuration gives a simple explicit, memory cached proxy.
To use a disk cache edit `squid.conf` to have a line like this
(5GB-ish cache):

    cache_dir ufs /var/cache/squid 51200 32 256

Of course not much useful for TLS content.

See
<https://wiki.alpinelinux.org/wiki/Setting_up_Explicit_Squid_Proxy>
for more advanced setup advice.

