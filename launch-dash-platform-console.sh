#!/bin/bash

echo "ENV DEV VARS"
echo ""
source ~/.evoenv
printenv | grep NUXT
echo ""

cd dapps/dash-platform-console
pm2 start npm --name "console" -- run serve
