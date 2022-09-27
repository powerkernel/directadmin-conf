#!/bin/sh
check=`cat /proc/loadavg | sed 's/\./ /' | awk '{print $1}'`

if [ $check -gt 9 ]
then
  service httpd restart
  service nginx restart
  service php-fpm81 restart
fi
