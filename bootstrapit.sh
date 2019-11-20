#!/bin/bash

export TERM="linux"
export DEBIAN_FRONTEND=noninteractive

start=$(date +%s)

exec > >(tee /var/log/user-data.log|logger -t user-data -s) 2>&1
# still buggy
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1

apt-get update

# Install docker
apt-get install -yq apt-transport-https ca-certificates curl software-properties-common 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-get install -yq docker-compose git

cd /tmp
# Thanks wurstmeister
git clone https://github.com/wurstmeister/kafka-docker
cd kafka-docker
sed -i 's/9092/9092:9092/g' docker-compose.yml
sed -i 's/192.168.99.100/127.0.0.1/g' docker-compose.yml
docker-compose up -d

echo "My IP: $(wget -t3 -T2 -qO-  http://169.254.169.254/latest/meta-data/local-ipv4)"