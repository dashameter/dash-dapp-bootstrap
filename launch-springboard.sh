#!/bin/bash

echo "ENV DEV VARS"
echo ""
source ~/.evoenv
printenv | grep NUXT
echo ""

cd dapps/springboard-cash
pm2 start npm --name "springboard" -- run local
