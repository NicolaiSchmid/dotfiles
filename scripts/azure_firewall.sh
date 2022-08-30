
resourceGroup='BOT-ca6abab9'
server="sql-ca6abab9"
ip=$(dig +short txt ch whoami.cloudflare @1.0.0.1 | sed -e 's/\"//g')

az sql server firewall-rule create -g $resourceGroup -s $server -n "nicolai dev $RANDOM" --start-ip-address $ip --end-ip-address $ip