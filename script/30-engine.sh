#!/bin/sh
set -x

# Wczytanie wspólnej konfiguracji
. $1

# wyczyszczenie
vault secrets disable kv/

# silnik sekretów "kv" (key/value)

vault secrets enable kv
vault path-help kv

vault secrets list

vault write kv/my-secret value="s3c(eT"
vault write kv/hello target=world
vault write kv/airplane type=boeing class=787

vault list kv

##
# Koniec
