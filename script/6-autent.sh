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

vault auth enable github
#vault auth help github
vault write auth/github/config organization=bpszss
vault write auth/github/map/teams/my_team value=default,my-policy

vault auth list
vault login -method=github token=f489a06c4c6043018ce23df54d40a406f15b7a7e


# Nie uda bez przelogowania na roota!
vault login $TOKEN
vault auth disable github

# ----------------------------------------------------------------------------
# Metoda autentyfikacji oparta o login/hasło

vault auth enable userpass
#vault auth help userpass

vault write auth/userpass/users/klosowski \
    password=abcdefg \
    policies=admins

vault write auth/userpass/users/antyfraud \
    password=qwerty \
    policies=automat_zewn

# Nie uda bez przelogowania na roota!
#vault login $TOKEN
#vault auth disable userpass
