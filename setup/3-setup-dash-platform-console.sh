#!/bin/bash

echo "ENV DEV VARS"
echo ""
source ~/.evoenv
printenv | grep NUXT
echo ""

cd dapps
git clone -b master https://github.com/dashameter/dash-platform-console.git
cd dash-platform-console
npm i
