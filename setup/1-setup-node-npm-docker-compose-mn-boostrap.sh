#!/bin/bash

if [ ! -d dapps ]; then
  mkdir -p dapps;
fi

sudo apt-get update
sudo apt install -y git vim curl net-tools
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y \
   apt-transport-https \
   ca-certificates \
   curl \
   gnupg-agent \
   software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Fix Permissions
sudo groupadd docker
sudo usermod -a $USER -G docker

# Make Sure Docker Is Running
sudo service --status-all
sudo service docker start
sudo service --status-all

# Setup mn-boostrap
/usr/bin/newgrp docker <<EONG
docker run hello-world
# sudo shutdown -r now # To reevaluate the group permissions
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Finetune the VM
echo "fs.inotify.max_user_watches = 524288" | sudo tee -a /etc/sysctl.conf
sudo npm i -g pm2

git clone -b master https://github.com/dashevo/dashmate.git
cd dashmate
npm install
# npm audit fix

sudo npm link

# Setup mn-boostrap
# mn reset
# mn config:reset
# docker ps -aq
# docker stop $(docker ps -aq)
# docker rm $(docker ps -aq)
# rm -rf ~/.mn
# mn setup local
# mn config:set core.miner.enable true
# mn config:set core.miner.address ySPRMNDVBhZVZvDS4wGn4Ujuq2wP4AcwLK
# mn wallet:mint 1 --address=ySPRMNDVBhZVZvDS4wGn4Ujuq2wP4AcwLK # rival estate inside turn journey charge window rhythm marble audit amateur bus
# mn wallet:mint 1 --address=ydYyVTNu5qXncaUTWPmAefmEPJiirH8VZv # cheese negative throw yard erase bitter struggle alter barrel found else velvet
# mn wallet:mint 1 --address=yXMfF8b1V1q3pyKLZKhL7RSgAJgBbB3GxC # mushroom dove remember inmate garlic inflict fetch swallow write sponsor wall manage
# mn wallet:mint 1 --address=yQKyEcB8UzkN69frjq4wmsnRjPJq5vTDaV # essay love suffer inquiry buffalo advance glue boil arrive glove clutch oyster
# mn wallet:mint 1 --address=yMCMNEuurehR48UsPdBxdfVvjx3zTWti2c # bless fluid disagree depart trade donor uniform dust month side dad tray
# mn wallet:mint 1 --address=yLqonMgTyCpo9MCH2grgoHBgkdSGkuJKmJ # luggage vacuum solution element rigid have provide enough defense champion frog camera
# mn wallet:mint 1 --address=ydKBJ1rrfurk7VMttezFsVSQy1b1Ar64D3 # catch fine embrace frequent prepare cruise relax faculty artwork yard sustain report
# mn wallet:mint 1 --address=ycKrwJhucrhwY9AJpujD8a4GpZ2eGDmcSW # neither neither apple collect warm trip luggage path tenant test liquid effort
# mn wallet:mint 1 --address=ybmsUnWfnFiU3ypJyBFNPaRmSz3kN4CJWo # neck neither tired bargain pizza quantum anxiety wait hire network nasty joke
# mn wallet:mint 1 --address=yaGV2CFWzr9KnRfYEYckx5smpwpvP8Qv4y # pride dolphin pluck orphan crunch erode soft damage metal corn risk slot
# mn wallet:mint 1 --address=yVYYpLJ9V2Kv7au6YGixGzzV7xnUYsRca6 # injury slender heart powder shove canal crash exile nest cement impact chair
# mn wallet:mint 1 --address=yQicETYJbbDDb9ZrZaRFwzr4YAnmvmDFbi # shock immense hand zoo mean seat vehicle artwork element month story water
# mn wallet:mint 1 --address=yZferUeCVR46Qqkziw5MaW1U8naaL6fvk2 # economy annual cool rally minute toast gas oyster august lamp sail isolate
# mn start
# EONG

# # SETUP LOCAL DEV VARS
# source ~/.evoenv
# # MYIP=$(ifconfig ens4 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*')
# echo "export NUXT_DPNS_CONTRACT_ID=$(mn config:get platform.dpns.contract.id)" >> ~/.evoenv
# echo "export NUXT_DAPIADDRESSES='[\"$VMIP:3000\"]'" >> ~/.evoenv # or your local network ip e.g. 192.168.0.1
# echo "export NUXT_LOCALNODE=true" >> ~/.evoenv # clientOpts.passFakeAssetLockProofForTests
# echo "export NUXT_MNEMONIC=\"rival estate inside turn journey charge window rhythm marble audit amateur bus\"" >> ~/.evoenv
# # receiving address for 'rival estate ... ySPRMNDVBhZVZvDS4wGn4Ujuq2wP4AcwLK


# # UNINSTALL
# # multipass delete mn-bootstrap && multipass purge
