# directadmin-conf
Direct Admin Conf

## Prepare
```
export CID=`YOUR_CLIENT_ID`
export LID=`YOUR_LICENSE_ID`
export LIP=`YOUR_LICENSE_IP`
export NETDEV=`YOUR_ETHERNET_DEVICE`

echo 1 > /root/.preinstall
echo $(hostname -f) > /root/.use_hostname

mkdir -p /usr/local/directadmin/custombuild
cd /usr/local/directadmin/custombuild
wget https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/options.conf
wget https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/php_extensions.conf
```

## Install
```
cd /root
wget directadmin.com/setup.sh
chmod 755 setup.sh
./setup.sh $CID $LID $(hostname -f) $NETDEV $LIP
```

## Config
```
cd /usr/local/directadmin/
./directadmin set ssl 1
./directadmin set ssl_redirect_host $(hostname -f)
./directadmin set force_hostname $(hostname -f)
./directadmin set carootcert /usr/local/directadmin/conf/carootcert.pem
./directadmin set letsencrypt_renewal_notice_to_admins 0
./directadmin set one_click_pma_login 1
cd /usr/local/directadmin/scripts
./letsencrypt.sh request $(hostname -f) ec384
sed -i 's+tcp://localhost+ssl://localhost+g' /var/www/html/roundcube/plugins/password/config.inc.php
```
