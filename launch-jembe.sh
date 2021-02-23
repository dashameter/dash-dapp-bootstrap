#!/bin/bash

echo "ENV DEV VARS"
echo ""
source ~/.evoenv
printenv | grep NUXT
echo ""

cd dapps/jembe
pm2 start npm --name "jembe" -- run local
