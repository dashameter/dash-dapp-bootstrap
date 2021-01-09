mkdir dapps
sudo apt-get update
sudo apt install -y git vim curl net-tools
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install \
   apt-transport-https \
   ca-certificates \
   curl \
   gnupg-agent \
   software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER
/usr/bin/newgrp docker <<EONG
docker run hello-world
# sudo shutdown -r now # To reevaluate the group permissions
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Finetune the VM
echo "fs.inotify.max_user_watches = 524288" | sudo tee -a /etc/sysctl.conf
sudo npm i -g pm2

git clone -b  master https://github.com/dashevo/mn-bootstrap.git
cd mn-bootstrap
npm install

sudo npm link

# Setup mn-boostrap 
mn setup local
mn config:set core.miner.enable true
mn config:set core.miner.address ySPRMNDVBhZVZvDS4wGn4Ujuq2wP4AcwLK
mn wallet:mint 1 --address=ySPRMNDVBhZVZvDS4wGn4Ujuq2wP4AcwLK # generate 100 blocks
mn start
EONG

# SETUP LOCAL DEV VARS
MYIP=$(ifconfig ens4 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*')
echo "export NUXT_DPNS_CONTRACT_ID=$(mn config:get platform.dpns.contract.id)" >> ~/.evoenv
echo "export NUXT_DAPIADDRESSES='[\"$MYIP:3000\"]'" >> ~/.evoenv # or your local network ip e.g. 192.168.0.1
echo "export NUXT_LOCALNODE=true" >> ~/.evoenv # clientOpts.passFakeAssetLockProofForTests
echo "export NUXT_MNEMONIC=\"rival estate inside turn journey charge window rhythm marble audit amateur bus\"" >> ~/.evoenv
# receiving address for 'rival estate ... ySPRMNDVBhZVZvDS4wGn4Ujuq2wP4AcwLK


# UNINSTALL
# multipass delete mn-bootstrap && multipass purge