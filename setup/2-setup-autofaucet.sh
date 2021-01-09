echo "ENV DEV VARS"
echo ""
source ~/.evoenv
printenv | grep NUXT
echo ""

cd dapps
git clone -b master https://github.com/dashameter/dash-dapp-autofaucet.git
cd dash-dapp-autofaucet
npm i


