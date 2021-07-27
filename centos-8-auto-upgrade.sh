#!/bin/sh
dnf install dnf-automatic
sed -i "s/apply_updates = no/apply_updates = yes/g" /etc/dnf/automatic.conf
systemctl enable --now dnf-automatic.timer
