#!/bin/bash

device_usb=$(df -h | grep /media/$(whoami)/DATA | awk '{print $1}')
echo $device_usb
if [ ! -z $device_usb ]; then
 usb_device_found=$(udevadm info --attribute-walk --name ${device_usb} | grep 5591)
 echo $usb_device_found
 if [ ! -z $usb_device_found ]; then
   unison sync-usb > ~/Desktop/sync-log.log 2>&1
 fi
fi
