#!/bin/bash

function install_pacakge  {
    package=$1
    # Gonna install the package check if all is ok
    if apt-get -qq install $package; then
        echo "Successfully installed $pkg"
    else
        echo "Error installing $pkg"
    fi
}

function is_dir {
    if [ -d "$1" ]; then
        return 1
    else
        return 0
    fi
}

function isRoot {
    # 0 = root by default
    if [ $EUID -ne "0" ]; then
       echo "This script must be run as root"
       return 1
    fi
    return 0
}

function get_ip_public {
    local ip
    ip=$(wget -qO- ifconfig.me/ip)
    return $ip
}

function ping_access {
  # -q quiet
  # -c how many ping to perform
  ping -q -c5 $1 > /dev/null
  rst=$?
  if [ $rst != 0 ]; then
    echo "$1 is unreachable. Please check your firewall or your network access." >> $HOME/results
  fi
  return $rst;
}

function default_case_while {
    echo "Sorry, your choice is not available'"
    read -p "Please try again : [Enter key]"
    clear
}