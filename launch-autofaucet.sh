#!/bin/bash

echo "ENV DEV VARS"
echo ""
source ~/.evoenv
printenv | grep NUXT
echo ""

cd dapps/dash-dapp-autofaucet
pm2 start --name "autofaucet" --exp-backoff-restart-delay 2000 index.js
