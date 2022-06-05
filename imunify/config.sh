#!/bin/sh

mkdir /home/imunify
wget -O /home/imunify/imunify-clean-all.sh https://raw.githubusercontent.com/powerkernel/directadmin-conf/cloudlinux/imnunify/imunify-clean-all.sh
wget -O /home/imunify/imunify-notification-custom-scan-finished.sh https://raw.githubusercontent.com/powerkernel/directadmin-conf/cloudlinux/imnunify/imunify-notification-custom-scan-finished.sh
wget -O /home/imunify/imunify-notification-custom-scan-malware-detected.sh https://raw.githubusercontent.com/powerkernel/directadmin-conf/cloudlinux/imnunify/imunify-notification-custom-scan-malware-detected.sh
wget -O /home/imunify/imunify-notification-custom-scan-started.sh https://raw.githubusercontent.com/powerkernel/directadmin-conf/cloudlinux/imnunify/imunify-notification-custom-scan-started.sh
wget -O /home/imunify/imunify-notification-user-scan-finished.sh https://raw.githubusercontent.com/powerkernel/directadmin-conf/cloudlinux/imnunify/imunify-notification-user-scan-finished.sh
wget -O /home/imunify/imunify-notification-user-scan-malware-detected.sh https://raw.githubusercontent.com/powerkernel/directadmin-conf/cloudlinux/imnunify/imunify-notification-user-scan-malware-detected.sh
wget -O /home/imunify/imunify-notification-user-scan-started.sh https://raw.githubusercontent.com/powerkernel/directadmin-conf/cloudlinux/imnunify/imunify-notification-user-scan-started.sh
chmod +x /home/imunify/*
chown root _imunify /home/imunify/*