#!/bin/sh
set -x

# Wczytanie wspólnej konfiguracji
. $1

OUT=`basename $0 .sh`.txt

# ----------------------------------------------------------------------------
vault policy write my-policy -<<EOF
# Normal servers have version 1 of KV mounted by default, so will need these
# paths:
path "secret/*" {
  capabilities = ["create"]
}
path "secret/foo" {
  capabilities = ["read"]
}

# Dev servers have version 2 of KV mounted by default, so will need these
# paths:
path "secret/data/*" {
  capabilities = ["create"]
}
path "secret/data/foo" {
  capabilities = ["read"]
}
EOF

vault policy list

vault policy read my-policy

vault token create -policy=my-policy > $OUT
TOKEN=`awk '$1~/^token$/{print $2}' $OUT`
vault login $TOKEN


vault kv put secret/data/bar robot=beepboop

vault kv put secret/data/foo robot=beepboop

TOKROOT=`awk '$1~/^token$/{print $2}' 4-autent.txt`
vault login $TOKROOT

vault write auth/my-github/map/teams/default value=my-policy
