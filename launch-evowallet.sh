echo "ENV DEV VARS"
echo ""
source ~/.evoenv
printenv | grep NUXT
echo ""

cd dapps/evowallet
pm2 start npm --name "evowallet" -- run local