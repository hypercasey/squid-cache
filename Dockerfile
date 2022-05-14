FROM container-registry.oracle.com/os/oraclelinux:8-slim
WORKDIR /container-entrypoint/
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN microdnf install squid procps-ng \
    openssl bind-utils iputils net-tools \
    bash-completion tar
COPY squid.conf /etc/squid/squid.conf
COPY entrypoint.sh /container-entrypoint/entrypoint.sh
COPY healthcheck.sh /container-entrypoint/healthcheck.sh
RUN chmod 0755 /container-entrypoint/entrypoint.sh
RUN chmod 0755 /container-entrypoint/healthcheck.sh
LABEL org.opencontainers.image.authors="casey@hyperspire.com"
LABEL org.opencontainers.image.source="HyperSpire LLC"
LABEL org.opencontainers.image.created="2022-04-08T04:14:00Z"
LABEL org.opencontainers.image.title="Squid Cache"
LABEL org.opencontainers.image.version="4.15"

EXPOSE 3128/tcp
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "/container-entrypoint/healthcheck.sh" ]
ENTRYPOINT [ "/container-entrypoint/entrypoint.sh" ]
CMD [ "squid", "-C", "-N", "-d 1", "-f /etc/squid/squid.conf" ]
