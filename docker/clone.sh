#!/usr/bin/env bash

export COP="${HOME}/GIT/cop"
mkdir -p ${COP}
cd ${COP}

git clone git@github.com:UKHomeOffice/RefData.git public_refdata_flyway
git clone ssh://git@gitlab.digital.homeoffice.gov.uk:2222/cop/private-refdata.git private_refdata_flyway
git clone ssh://git@gitlab.digital.homeoffice.gov.uk:2222/cop/private-reports.git reporting_data
cd reporting_data
git checkout develop
cd ${COP}

