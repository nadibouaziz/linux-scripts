#!/bin/bash

##
# Note : It's just to show an other possibility, just for your own knowledge
# Allowing all traffic on newly created networks can expose your containers to unwanted access
# 
# This script has to be run in bg.
# More "risky" but if you're sure your computer is safe, you're good.
#
##

docker events --filter event=create --filter event=network | while read event
do
    # Extract the network id from the event (4th column v27.2.1)
    network_id=$(echo $event | awk '{print $4}')

    #Add iptables rules for the new network
    iptables -t filter -A INPUT -i br-$network_name -j ACCEPT
    iptables -t filter -A OUTPUT -o br-$network_name -j ACCEPT
done
