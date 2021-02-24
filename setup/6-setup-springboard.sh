#!/bin/bash

echo "ENV DEV VARS"
echo ""
source ~/.evoenv
printenv | grep NUXT
echo ""

cd dapps
git clone -b master https://github.com/dashameter/springboard-cash.git
cd springboard-cash
npm i
