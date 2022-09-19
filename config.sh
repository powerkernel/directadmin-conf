#!/bin/sh

# Forward root email
echo "harry@powerkernel.com" > /root/.forward

# Admin name
sed -i "0,/name=admin/s//name=$ADMIN_NAME/" /usr/local/directadmin/data/users/admin/user.conf

# S3FS
yum install s3fs-fuse -y
echo "$AWS_S3_KEY:$AWS_S3_SECERT" > /etc/passwd-s3fs
chmod 600 /etc/passwd-s3fs
echo "s3fs#$AWS_S3_BUCKET /home/admin/admin_backups fuse _netdev,allow_other,use_path_request_style,url=https://$AWS_S3_REGION,umask=0000 0 0" >> /etc/fstab

# Install ncftpls
cd /usr/local/directadmin/scripts
./ncftp.sh

# Direct Admin/Custombuild settings: https://docs.directadmin.com/directadmin/general-usage/all-directadmin-conf-values.html
/usr/local/directadmin/directadmin set force_hostname $(hostname -f)
/usr/local/directadmin/directadmin set letsencrypt_renewal_notice_to_admins 0
/usr/local/directadmin/directadmin set clear_blacklist_ip_time 1440
/usr/local/directadmin/directadmin set unblock_brute_ip_time 1440
/usr/local/directadmin/directadmin set ip_brutecount 10
/usr/local/directadmin/directadmin set user_brutecount 10
/usr/local/directadmin/directadmin set enforce_difficult_passwords 1
/usr/local/directadmin/directadmin set hide_brute_force_notifications 1
/usr/local/directadmin/directadmin set purge_spam_days 7
/usr/local/directadmin/directadmin set default_ttl 14400
/usr/local/directadmin/directadmin set brute_force_scan_apache_logs 2
/usr/local/directadmin/directadmin set one_click_webmail_login 1
/usr/local/directadmin/directadmin set webmail_link roundcube
/usr/local/directadmin/directadmin set one_click_webmail_link /webmail

/usr/local/directadmin/custombuild/build set redirect_host $(hostname -f)

# HTTPS redirect
Add to near bottom /etc/httpd/conf/extra/httpd-includes.conf
```
<location /phpMyAdmin>
  RewriteEngine On
  RewriteCond %{HTTPS} off
  RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}
</location>
<location /webmail>
  RewriteEngine On
  RewriteCond %{HTTPS} off
  RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}
</location>
<location /roundcube>
  RewriteEngine On
  RewriteCond %{HTTPS} off
  RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}
</location>
```

# PMA One-Click login
/usr/local/directadmin/directadmin set one_click_pma_login 1
service directadmin restart
/usr/local/directadmin/custombuild/build update
/usr/local/directadmin/custombuild/build phpmyadmin

# disable email for new account
mkdir -p /usr/local/directadmin/scripts/custom
wget -O /usr/local/directadmin/scripts/custom/user_create_post.sh https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/scripts/user_create_post.sh
chmod 755 /usr/local/directadmin/scripts/custom/user_create_post.sh

# Email templates
mkdir -p /usr/local/directadmin/data/templates/custom
wget -O /usr/local/directadmin/data/templates/custom/a_welcome.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/a_welcome.html
wget -O /usr/local/directadmin/data/templates/custom/u_welcome.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/u_welcome.html
wget -O /usr/local/directadmin/data/templates/custom/r_welcome.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/r_welcome.html

wget -O /usr/local/directadmin/data/admin/a_welcome.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/a_welcome.html
wget -O /usr/local/directadmin/data/admin/r_welcome.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/r_welcome.html
wget -O /usr/local/directadmin/data/users/admin/u_welcome.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/u_welcome.html

wget -O /usr/local/directadmin/data/templates/custom/message_footer.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/message_footer.txt
wget -O /usr/local/directadmin/data/templates/custom/message_tech.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/message_tech.html
wget -O /usr/local/directadmin/data/templates/custom/message_user.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/message_user.html
wget -O /usr/local/directadmin/data/templates/custom/lost_password_email.txt https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/email-templates/lost_password_email.html

# STMP for admin
wget -O /etc/exim.routers.pre.conf http://files.directadmin.com/services/SpamBlocker/smart_route/exim.routers.pre.conf
wget -O /etc/exim.transports.pre.conf http://files.directadmin.com/services/SpamBlocker/smart_route/exim.transports.pre.conf
wget -O /etc/exim.authenticators.post.conf http://files.directadmin.com/services/SpamBlocker/smart_route/exim.authenticators.post.conf
sed -i "s/your@email.com : yourpass/$SMTP_USER : $SMTP_PASS/g" /etc/exim.authenticators.post.conf
sed -i "s/smtp.yourisp.com/$SMTP_HOST::$SMTP_PORT/g" /etc/exim.routers.pre.conf
sed -i "s/manualroute/manualroute\n     senders = *@$(hostname -f)/g" /etc/exim.routers.pre.conf
service exim restart

# MISC
wget -O /usr/local/directadmin/data/templates/custom/mail_settings.html https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/misc/mail_settings.html
wget -O /usr/local/directadmin/data/templates/custom/outlook_setup.reg https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/misc/outlook_setup.reg

# reload, rebuild
/usr/local/directadmin/custombuild/build rewrite_confs
