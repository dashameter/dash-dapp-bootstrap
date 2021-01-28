# Spin up a new multipass vm instance
multipass launch --name mn-bootstrap -d 8G -m 8G -c 2

# Read out virtual machine IP and save it to the VM
VMIP=$(multipass info mn-bootstrap | grep IPv4 | grep -Eo '([0-9]*\.){3}[0-9]*')
multipass exec mn-bootstrap -- bash -c "echo export VMIP=$VMIP >> ~/.evoenv"

# Install dependencies, config vm environment, install mn-bootstrap and config miner and env vars
multipass exec mn-bootstrap -- bash < ./setup/1-setup-node-npm-docker-compose-mn-boostrap.sh

# Backup ENV DEV VARS
if [ -f ~/.evoenv ]; then
  mv ~/.evoenv ~/.evoenv_backup$(date --iso-8601=seconds)
fi

# Install dependencies, config environment, install mn-bootstrap and config miner and env vars
# Copy ENV DEV vars to local machine
multipass exec mn-bootstrap -- cat .evoenv > ~/.evoenv

# Setup and launch autofaucet & dapps
multipass exec mn-bootstrap -- bash < ./setup/2-setup-autofaucet.sh
multipass exec mn-bootstrap -- bash < ./launch-autofaucet.sh

multipass exec mn-bootstrap -- bash < ./setup/3-setup-dash-platform-console.sh
multipass exec mn-bootstrap -- bash < ./launch-dash-platform-console.sh

multipass exec mn-bootstrap -- bash < ./setup/4-setup-evowallet.sh
multipass exec mn-bootstrap -- cat .evoenv > ~/.evoenv
multipass exec mn-bootstrap -- bash < ./launch-evowallet.sh

multipass exec mn-bootstrap -- bash < ./setup/5-setup-jembe.sh
multipass exec mn-bootstrap -- cat .evoenv > ~/.evoenv
multipass exec mn-bootstrap -- bash < ./launch-jembe-loggedin.sh

echo "Autofaucet http://$VMIP:5050/drip/[address]"
echo "Console http://$VMIP:8080"
echo "EvoWallet http://$VMIP:3330"
echo "Jembe http://$VMIP:3331"