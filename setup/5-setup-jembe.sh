#!/bin/bash

echo "ENV DEV VARS"
echo ""
source ~/.evoenv
printenv | grep NUXT
echo ""

cd dapps
git clone -b master https://github.com/dashameter/jembe.git
cd jembe
npm i


source ~/.evoenv
export NUXT_ENV_RUN="local"

node ./scripts/registerContracts.js

source ./env/datacontracts_$NUXT_ENV_RUN.env

npm run register:testuser

echo
echo "ENV DEV VARS"
echo
printenv | grep NUXT
echo
