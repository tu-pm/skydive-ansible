#!/bin/bash
for intf in `ls -l /sys/class/net/ | grep "\->" | grep -v virtual | awk '{print $9}'`
do
  /sbin/ip l set $intf up
  sleep 1
  DOWN=`/sbin/ip l show $intf | grep DOWN`
  if [ ! -n "$DOWN" ] ; then
    /sbin/ip maddress add 01:80:c2:00:00:0e dev $intf
    /sbin/ip maddress add 01:80:c2:00:00:03 dev $intf
    /sbin/ip maddress add 01:80:c2:00:00:00 dev $intf
  fi
done
