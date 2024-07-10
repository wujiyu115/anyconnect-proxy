#!/bin/bash

set -e

echo $VPN_PASSWORD | openconnect --user=$VPN_USER $OPENCONNECT_OPTIONS --passwd-on-stdin --csd-wrapper=/usr/libexec/openconnect/csd-wrapper.sh --script-tun --script "ocproxy -g -k 60 -D 9052" --os=linux-64 $VPN_HOST

exec "$@"
