#! /usr/bin/bash

set -euo pipefail

TMP=$(mktemp)

(gpclient --fix-openssl connect utdvpn.utdallas.edu > "${TMP}" 2>&1 || echo "Failed to connect!") &

inotifywait -e create --include gpclient.lock /var/run \
    && echo "Successful connection!"

