#!/bin/sh
mkdir -p /usr/local/directadmin/custombuild
wget -O /usr/local/directadmin/custombuild/options.conf https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/options-default.conf
wget -O /usr/local/directadmin/custombuild/php_extensions.conf https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/php_extensions.conf

# install
curl https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/install.sh | sh

# config
curl https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/config.sh | sh