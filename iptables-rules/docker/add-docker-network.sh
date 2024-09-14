#!/bin/bash

######
# How to use : 
#
# bash script.sh <docker-network-name>
# 
######

docker_network=$1

if [[ -z "$docker_network" ]]; then
    echo 'Provide a docker network name'
    exit 1;
fi

network_name=$(docker network ls | grep $docker_network | awk '{print $1}')

if [[ -z "$network_name" ]]; then
    echo 'Network name not found'
    exit 1;
fi

# Add iptables rules for the new network
iptables -t filter -A INPUT -i br-$network_name -j ACCEPT
iptables -t filter -A OUTPUT -o br-$network_name -j ACCEPT
