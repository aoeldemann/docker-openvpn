#!/bin/sh
if [ -f "/scripts/preup.sh" ]; then
  /scripts/preup.sh
fi

while true; do
  sg vpn -c "openvpn --config /config/vpn.conf --log /var/log/openvpn.log"
  sleep 10
done
