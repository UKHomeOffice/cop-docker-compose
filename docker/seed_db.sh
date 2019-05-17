#!/usr/bin/env bash

export POSTGRES_PORT="${POSTGRES_PORT:-5434}"
export POSTGRES_SERVER="${POSTGRES_SERVER:-localhost}"
export POSTGRES_DB="${POSTGRES_DB:-operation}"
export POSTGRES_SCHEMA="${POSTGRES_SCHEMA:-operation}"
export POSTGRES_OPTIONS=${POSTGRES_OPTIONS:-}
export PGPASSWORD="${PGPASSWORD:-mysecretpassword}"
export DB_USER="${DB_USER:-owneroperation}"

export FIRSTNAME="${FIRSTNAME:-dev}"
export SURNAME="${SURNAME:-one}"
export EMAIL="${EMAIL:-dev1@lodev.xyz}"
export PHONE="${PHONE:-00000000000}"
export DEFAULT_TEAM="${DEFAULT_TEAM:-737674f3-6fc2-413e-aca3-ce06b42e4a7a}"
export ROLE="linemanager"

echo "postgresql://${DB_USER}@${POSTGRES_SERVER}:${POSTGRES_PORT}/${POSTGRES_DB}${POSTGRES_OPTIONS}"
IDENTITYID=$(psql postgresql://${DB_USER}@${POSTGRES_SERVER}:${POSTGRES_PORT}/${POSTGRES_DB}${POSTGRES_OPTIONS} -t -c "
set search_path='$POSTGRES_SCHEMA';
INSERT into identity(firstname, surname) VALUES('$FIRSTNAME', '$SURNAME') RETURNING identityid;" | awk 'NR==1{print $1}')

echo "postgresql://${DB_USER}@${POSTGRES_SERVER}:${POSTGRES_PORT}/${POSTGRES_DB}${POSTGRES_OPTIONS}"
STAFFID=$(psql postgresql://${DB_USER}@${POSTGRES_SERVER}:${POSTGRES_PORT}/${POSTGRES_DB}${POSTGRES_OPTIONS} -t -c "
set search_path='$POSTGRES_SCHEMA';
INSERT into staff(identityid, email, phone, defaultteamid) VALUES('$IDENTITYID', '$EMAIL', '$PHONE', '$DEFAULT_TEAM') RETURNING staffid;" | awk 'NR==1{print $1}')


echo "postgresql://${DB_USER}@${POSTGRES_SERVER}:${POSTGRES_PORT}/${POSTGRES_DB}${POSTGRES_OPTIONS}"
psql postgresql://${DB_USER}@${POSTGRES_SERVER}:${POSTGRES_PORT}/${POSTGRES_DB}${POSTGRES_OPTIONS} -t -c "
set search_path='$POSTGRES_SCHEMA';
INSERT into role_members(rolelabel, staffid) VALUES('linemanager', '$STAFFID');
INSERT into role_members(rolelabel, staffid) VALUES('copge', '$STAFFID');
INSERT into role_members(rolelabel, staffid) VALUES('copra', '$STAFFID');
INSERT into role_members(rolelabel, staffid) VALUES('systemuser', '$STAFFID');"
