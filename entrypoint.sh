#!/bin/bash

set -e

run () {
    echo openconnect start
    echo $VPN_PASSWORD | openconnect --user=$VPN_USER $OPENCONNECT_OPTIONS --passwd-on-stdin --script-tun --script "ocproxy -D 9052" $VPN_HOST
}

until (run); do
  echo "openconnect exited. Restarting process in 60 seconds…" >&2
  sleep 60
done
