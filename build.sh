git clone https://github.com/blockstream/esplora
cp -r esplora-add/* esplora
cd esplora
sed -e 's/electrs --timestamp/electrs -vvvv --timestamp/' contrib/supervisord.conf.in -i
docker build -t esplora .
cd ..
