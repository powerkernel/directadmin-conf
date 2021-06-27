#/bin/bash
for a in `find /usr/local/directadmin/data/users/*/domains.list`; do
  u=`echo "$a" | awk -F / '{ print $7 }'`
   for d in `cat $a`; do
     host -t ns "$d"
     echo '\n'
     done
  done
