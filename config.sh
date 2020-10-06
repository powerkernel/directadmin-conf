#!/bin/sh

# Direct Admin settings
/usr/local/directadmin/directadmin set ssl_redirect_host $(hostname -f)
/usr/local/directadmin/directadmin set force_hostname $(hostname -f)
/usr/local/directadmin/directadmin set letsencrypt_renewal_notice_to_admins 0
/usr/local/directadmin/directadmin set one_click_pma_login 1
/usr/local/directadmin/directadmin set hide_brute_force_notifications 1
/usr/local/directadmin/directadmin set lost_password 1
/usr/local/directadmin/directadmin set clear_blacklist_ip_time 1440
/usr/local/directadmin/directadmin set unblock_brute_ip_time 1440
/usr/local/directadmin/directadmin set ip_brutecount 10
/usr/local/directadmin/directadmin set user_brutecount 10
/usr/local/directadmin/directadmin set enforce_difficult_passwords 1
/usr/local/directadmin/directadmin set purge_spam_days 7
service directadmin restart

# DKIM
/usr/local/directadmin/directadmin set dkim 1
service directadmin restart
/usr/local/directadmin/custombuild/build update
/usr/local/directadmin/custombuild/build exim
/usr/local/directadmin/custombuild/build eximconf
/usr/local/directadmin/scripts/dkim_create.sh $(hostname -f)

# SSL
/usr/local/directadmin/scripts/letsencrypt.sh request $(hostname -f) ec384
/usr/local/directadmin/directadmin set carootcert /usr/local/directadmin/conf/carootcert.pem
/usr/local/directadmin/directadmin set ssl 1
sed -i 's+tcp://localhost+ssl://localhost+g' /var/www/html/roundcube/plugins/password/config.inc.php
service directadmin restart

# Auto block IPs
yum -y install iptables-services
systemctl enable iptables
mv /usr/libexec/iptables/iptables.init /usr/libexec/iptables/iptables.init.backup
wget -O /usr/libexec/iptables/iptables.init http://files.directadmin.com/services/all/block_ips/2.2/iptables
wget -O /usr/local/directadmin/scripts/custom/block_ip.sh http://files.directadmin.com/services/all/block_ips/2.2/block_ip.sh
wget -O /usr/local/directadmin/scripts/custom/show_blocked_ips.sh http://files.directadmin.com/services/all/block_ips/2.2/show_blocked_ips.sh
wget -O /usr/local/directadmin/scripts/custom/unblock_ip.sh http://files.directadmin.com/services/all/block_ips/2.2/unblock_ip.sh
wget -O /usr/local/directadmin/scripts/custom/brute_force_notice_ip.sh http://files.directadmin.com/services/all/block_ips/2.2/brute_force_notice_ip.sh
chmod 700 /usr/local/directadmin/scripts/custom/block_ip.sh 
chmod 700 /usr/local/directadmin/scripts/custom/show_blocked_ips.sh 
chmod 700 /usr/local/directadmin/scripts/custom/unblock_ip.sh
chmod 700 /usr/local/directadmin/scripts/custom/brute_force_notice_ip.sh
chmod 755 /usr/libexec/iptables/iptables.init
chattr +i /usr/libexec/iptables/iptables.init
touch /root/blocked_ips.txt
touch /root/exempt_ips.txt
systemctl start iptables
service directadmin restart

# Email templates
mkdir -p /usr/local/directadmin/data/templates/custom
wget -O /usr/local/directadmin/data/templates/custom/a_welcome.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/a_welcome.html
wget -O /usr/local/directadmin/data/templates/custom/u_welcome.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/u_welcome.html
wget -O /usr/local/directadmin/data/templates/custom/r_welcome.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/r_welcome.html
wget -O /usr/local/directadmin/data/templates/custom/message_footer.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/message_footer.txt
wget -O /usr/local/directadmin/data/templates/custom/message_tech.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/message_tech.html
wget -O /usr/local/directadmin/data/templates/custom/message_user.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/message_user.html
wget -O /usr/local/directadmin/data/templates/custom/lost_password_email.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/lost_password_email.html

# DNS
wget -O /usr/local/directadmin/data/templates/custom/dns_a.conf https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/dns/dns_a.conf
wget -O /usr/local/directadmin/data/templates/custom/dns_aaaa.conf https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/dns/dns_aaaa.conf
wget -O /usr/local/directadmin/data/templates/custom/dns_cname.conf https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/dns/dns_cname.conf
wget -O /usr/local/directadmin/data/templates/custom/dns_mx.conf https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/dns/dns_mx.conf
wget -O /usr/local/directadmin/data/templates/custom/dns_txt.conf https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/dns/dns_txt.conf