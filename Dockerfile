FROM ubuntu:latest
MAINTAINER Andreas Oeldemann <hey@aoel.io>

RUN apt-get update \
 && apt-get install -y --no-install-recommends openvpn iptables curl \
      inetutils-ping net-tools ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN groupadd --system vpn

COPY init.sh /
COPY resolvconf /sbin/

VOLUME ["/config", "/scripts", "/state", "/keys"]

ENTRYPOINT ["/init.sh"]
