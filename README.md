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
/usr/local/directadmin/directadmin set ssl 1
/usr/local/directadmin/directadmin set ssl_redirect_host $(hostname -f)
/usr/local/directadmin/directadmin set force_hostname $(hostname -f)
/usr/local/directadmin/directadmin set carootcert /usr/local/directadmin/conf/carootcert.pem
/usr/local/directadmin/directadmin set letsencrypt_renewal_notice_to_admins 0
/usr/local/directadmin/directadmin set one_click_pma_login 1
/usr/local/directadmin/directadmin set hide_brute_force_notifications 1

/usr/local/directadmin/scripts/letsencrypt.sh request $(hostname -f) ec384

sed -i 's+tcp://localhost+ssl://localhost+g' /var/www/html/roundcube/plugins/password/config.inc.php

yum -y install iptables-services
systemctl enable iptables
cd /usr/libexec/iptables
mv iptables.init iptables.init.backup
wget -O iptables.init http://files.directadmin.com/services/all/block_ips/2.2/iptables
chmod 755 iptables.init

cd /usr/local/directadmin/scripts/custom
wget -O block_ip.sh http://files.directadmin.com/services/all/block_ips/2.2/block_ip.sh
wget -O show_blocked_ips.sh http://files.directadmin.com/services/all/block_ips/2.2/show_blocked_ips.sh
wget -O unblock_ip.sh http://files.directadmin.com/services/all/block_ips/2.2/unblock_ip.sh
chmod 700 block_ip.sh show_blocked_ips.sh unblock_ip.sh

touch /root/blocked_ips.txt
touch /root/exempt_ips.txt

cd /usr/local/directadmin/scripts/custom
wget -O brute_force_notice_ip.sh http://files.directadmin.com/services/all/block_ips/2.2/brute_force_notice_ip.sh
chmod 700 brute_force_notice_ip.sh
systemctl start iptables

/usr/local/directadmin/directadmin set lost_password 1
/usr/local/directadmin/directadmin set clear_blacklist_ip_time 1440
/usr/local/directadmin/directadmin set unblock_brute_ip_time 1440
/usr/local/directadmin/directadmin set ip_brutecount 10
/usr/local/directadmin/directadmin set user_brutecount 10
/usr/local/directadmin/directadmin set enforce_difficult_passwords 1
/usr/local/directadmin/directadmin set purge_spam_days 7
service directadmin restart

```
