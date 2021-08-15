#!/bin/sh
dnf install dnf-automatic -y
sed -i "s/apply_updates = no/apply_updates = yes/g" /etc/dnf/automatic.conf
systemctl enable --now dnf-automatic.timer
sed -i "s/GRUB_CMDLINE_LINUX=\"/GRUB_CMDLINE_LINUX=\"rootflags=uquota,pquota /g" /etc/default/grub
cp /boot/grub2/grub.cfg /boot/grub2/grub.cfg.orig
grub2-mkconfig -o /boot/grub2/grub.cfg
dnf install perl-IO-Socket-INET6.noarch -y
dnf install perl-LWP-Protocol-https -y
reboot
