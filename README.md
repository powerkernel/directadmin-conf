# directadmin-conf
Direct Admin Conf

## config
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
