#! /bin/sh
set -x

# Wczytanie wspólnej konfiguracji
. $1

vault status

vault secrets list

vault kv put secret/hello foo=world
vault kv get secret/hello
vault kv delete secret/hello
