#!/bin/sh
set -x

# Wczytanie wspólnej konfiguracji
. $1

# ----------------------------------------------------------------------------
# Metoda autentyfikacji oparta na bezpośredniej znajomości tokena (dla root-a)

OUT=`basename $0 .sh`.txt

vault token create > $OUT

TOKEN=`awk '$1~/^token$/{print $2}' $OUT`

vault auth list
#vault auth help token
vault login $TOKEN

# ----------------------------------------------------------------------------
# Metoda autentyfikacji oparta na bezpośredniej znajomości tokena (dla
# zwykłego usera)

# ?????????????????????????????????/

# ----------------------------------------------------------------------------
# Metoda autentyfikacji oparta o GitHuba (dla pklosows)

vault auth enable -path=my-github github
vault write auth/my-github/config organization=bpszss
vault write auth/my-github/map/teams/my_team value=default,my-policy

vault auth list
#vault auth help github
vault login -method=github -path=my-github token=94db41192279bbb45ca2049879f7efe265a3f541


# Nie uda bez przelogowania na roota!
vault login $TOKEN
#vault auth disable my-github
