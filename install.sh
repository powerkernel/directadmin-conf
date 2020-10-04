#!/bin/sh
echo 1 > /root/.preinstall
echo $(hostname -f) > /root/.use_hostname
wget -O /root/setup.sh https://directadmin.com/setup.sh
chmod 755 /root/setup.sh
/root/setup.sh $CID $LID $(hostname -f) $NETDEV $LIP
