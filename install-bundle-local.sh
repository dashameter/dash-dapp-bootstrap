#!/bin/bash

# Backup ENV DEV VARS
if [ -f ~/.evoenv ]; then
  mv ~/.evoenv ~/.evoenv_backup$(date --iso-8601=seconds)
fi

# Install dependencies, config environment, install mn-bootstrap and config miner and env vars
./setup/1-setup-node-npm-docker-compose-mn-boostrap.sh

echo "export NUXT_DAPIADDRESSES='[\"127.0.0.1:3000\"]'" >> ~/.evoenv
echo "export NUXT_INSIGHTAPI='http://127.0.0.1:3001'" >> ~/.evoenv

# Setup and launch autofaucet
./setup/2-setup-autofaucet.sh
./launch-autofaucet.sh


# Setup dapps
./setup/3-setup-dash-platform-console.sh
./setup/4-setup-evowallet.sh
./setup/5-setup-jembe.sh

# Launch dapps
./launch-dash-platform-console.sh
./launch-evowallet.sh
./launch-jembe.sh


echo "Autofaucet http://127.0.0.1:5050/drip/[address]"
echo "Console http://127.0.0.1:8080"
echo "EvoWallet http://127.0.0.1:3330"
echo "Jembe http://127.0.0.1:3331"
