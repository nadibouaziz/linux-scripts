#!/bin/bash

##
# This will allow all incoming and outgoing traffic on any bridge network created by Docker.
# More "risky" but if you're sure your computer is safe, you're good.
# 
##
iptables -I DOCKER-USER -i br-+ -j ACCEPT
iptables -I DOCKER-USER -o br-+ -j ACCEPT
