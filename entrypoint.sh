#!/usr/bin/bash

if [[ `/usr/sbin/squid -C -N -d 1 -f /etc/squid/squid.conf` ]]; then
  echo "Squid is running."
else
  echo "Squid is not running."
  ( /usr/sbin/squid -C -N -d 1 -f /etc/squid/squid.conf )
fi
