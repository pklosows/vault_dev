#! /bin/sh
set -x

# Wczytanie wspólnej konfiguracji
. $1

vault status

vault secrets list

# wstawienie

vault kv put secret/hello foo=world1

vault kv put secret/hello foo=world2 excited=yes

# pobranie 

vault kv get secret/hello

vault kv get -field=excited secret/hello

# json

vault kv get -format=json secret/hello

vault kv get -format=json secret/hello | jq -r .data.data.excited

# kasowanie

vault kv delete secret/hello
