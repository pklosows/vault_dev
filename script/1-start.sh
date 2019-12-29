#! /bin/sh
set -x

# Wczytanie wspólnej konfiguracji
. $1

# ubicie ew. poprzedniego serwera
kill `ps aux | awk '$0~/[0-9] vault server/{print $2}'` 2> /dev/null

# odpalenie nowego serwera
vault server -dev \
    -dev-listen-address=$VAULT_DEV_LISTEN_ADDRESS \
    -dev-root-token-id=$VAULT_DEV_ROOT_TOKEN_ID
