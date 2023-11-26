#!/bin/bash

#build RAID 10

mdadm --zero-superblock --force /dev/sd{b,c,d,e}

mdadm --create --verbose /dev/md0 -l 10 -n 4 /dev/sd{b,c,d,e}

if [ $? -eq 0 ]; then
    mkdir /etc/mdadm
    echo "DEVICE partitions" > /etc/mdadm/mdadm.conf
    mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf
fi