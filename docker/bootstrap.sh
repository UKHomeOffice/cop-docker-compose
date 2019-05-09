#!/usr/bin/env bash
export COP="${HOME}/GIT/cop"

docker network create web
docker network create db

if [[ -f /sbin/ifconfig ]]
then
    sudo ifconfig lo0 alias 10.254.254.254
elif [[ -f /sbin/ip ]]
then
    sudo ip addr add 10.254.254.254/32 dev lo
else
    echo "need to setup local loopback to know 10.254.254.254/32"
fi

mkdir -p proxy/acme
touch proxy/acme/acme.json

if [[ -f platform/mobileid-key.pem ]]
then
    echo "existing mobileID key exists"
else
    openssl genrsa -des3 -out platform/mobileid-key.pem 2048
    openssl rsa -in platform/mobileid-key.pem -out mobileid-key.pem
fi


## Cloning repos locally to get data

mkdir -p ${COP}
cd ${COP}

git clone git@github.com:UKHomeOffice/RefData.git public_refdata_flyway
git clone ssh://git@gitlab.digital.homeoffice.gov.uk:2222/cop/private-refdata.git private_refdata_flyway
git clone ssh://git@gitlab.digital.homeoffice.gov.uk:2222/cop/private-reports.git reporting_data
git clone ssh://git@gitlab.digital.homeoffice.gov.uk:2222/cop/private-operational-flyway.git private_operational_flyway
cd reporting_data
git checkout develop
cd ${COP}
git clone https://github.com/UKHomeOffice/cop-examples.git cop_examples
