#!/usr/bin/env bash

docker network create web
docker network create db
sudo ifconfig lo0 alias 10.254.254.254
mkdir -p proxy/acme
touch proxy/acme/acme.json
