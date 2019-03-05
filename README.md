# esplora

docker swarm init
docker network create --driver=overlay --attachable --opt encrypted esploranet
docker stack deploy -c docker-compose.yml tls

docker run -d --expose 80 --network=esploranet --name esplora -v /home/debian/data_bitcoin_mainnet:/data --rm -e "VIRTUAL_HOST=explorer.bullbitcoin.com" -e "LETSENCRYPT_HOST=explorer.bullbitcoin.com" -e "LETSENCRYPT_EMAIL=francis@satoshiportal.com" esplora bash -c "/srv/explorer/run.sh bitcoin-mainnet explorer"

docker run -d --expose 80 --network=esploranet --name esplora -v /home/debian/data_bitcoin_mainnet:/data --rm -e "VIRTUAL_HOST=explorer.kexkey.com" -e "LETSENCRYPT_HOST=explorer.kexkey.com" -e "LETSENCRYPT_EMAIL=letsencrypt@kexkey.com" esplora bash -c "/srv/explorer/run.sh bitcoin-mainnet explorer"
