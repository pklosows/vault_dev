#! /bin/sh
set -x

# Wczytanie wspólnej konfiguracji
. $1

vault server -dev \
    -dev-listen-address=$VAULT_DEV_LISTEN_ADDRESS \
    -dev-root-token-id=$VAULT_DEV_ROOT_TOKEN_ID
