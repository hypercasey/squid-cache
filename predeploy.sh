#!/usr/bin/bash

cp -vf ~/Projects/proxy/squid/Dockerfile ~/hyperstor/squid/Dockerfile
cp -vf ~/Projects/proxy/squid/squid.conf ~/hyperstor/squid/squid.conf
cp -vf ~/Projects/proxy/squid/docker-compose.yml ~/hyperstor/squid/docker-compose.yml
cp -vf ~/Projects/proxy/squid/entrypoint.sh ~/hyperstor/squid/entrypoint.sh
cp -vf ~/Projects/proxy/squid/healthcheck.sh ~/hyperstor/squid/healthcheck.sh

