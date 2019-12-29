#!/bin/sh
set -x

# Wczytanie wspólnej konfiguracji
. $1

# wyczyszczenie
vault secrets disable hurt/

# silnik sekretów "kv" (key/value)

vault secrets enable -path=hurt kv

vault secrets list

vault write hurt/klosowski          password=xyz  type=user expire=30
vault write hurt/antyfraud          password=asd0 type=interfejs expire=90
vault write hurt/antyfraud_etl      password=asd1 type=interfejs expire=90
vault write hurt/antyfraud_etl_tst  password=asd2 type=interfejs expire=90
vault write hurt/antyfraud_etl_dev  password=asd3 type=interfejs expire=90

vault list hurt

vault read hurt/klosowski

vault read -field=password hurt/klosowski

vault kv get -field=password  hurt/klosowski

vault read hurt/antyfraud_etl_tst  

##
# Koniec
