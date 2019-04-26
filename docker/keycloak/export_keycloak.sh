#!/usr/bin/env bash
docker run --rm --network=db\
    --name keycloak_exporter\
    -v ${PWD}/dev:/tmp/keycloak-export\
    -e DB_DATABASE=keycloak\
    -e DB_PASSWORD=password\
    -e DB_USER=keycloak\
    -e DB_VENDOR=POSTGRES\
    -e DB_ADDR=postgres_keycloak\
    jboss/keycloak:master\
    -Dkeycloak.migration.action=export\
    -Dkeycloak.migration.provider=dir\
    -Dkeycloak.migration.dir=/tmp/keycloak-export\
    -Dkeycloak.migration.usersExportStrategy=REALM_FILE\
    -Dkeycloak.migration.realmName=dev
