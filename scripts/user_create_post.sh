#!/bin/sh
CURUNIXTIME=`date +"%s"`
echo "${username}: ${CURUNIXTIME}" >> /etc/virtual/blacklist_script_usernames
