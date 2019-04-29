#!/usr/bin/env bash

docker network create web
docker network create db
sudo ifconfig lo0 alias 10.254.254.254
mkdir -p proxy/acme
touch proxy/acme/acme.json

if [[ -f platform/mobileid-key.pem ]]
then
    echo "existing mobileID key exists"
else
    openssl genrsa -des3 -out platform/mobileid-key.pem 2048
    openssl rsa -in platform/mobileid-key.pem -out mobileid-key.pem
fi
