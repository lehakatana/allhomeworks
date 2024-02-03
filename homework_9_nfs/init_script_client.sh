#!/bin/env bash

yum install nfs-utils -y
systemctl start firewalld
systemctl enable firewalld
cat << EOF > /etc/fstab
192.168.56.10:/srv/share/ /mnt nfs vers=3,noauto,x-systemd.automount 0 0
EOF
systemctl daemon-reload 
systemctl restart remote-fs.target
touch /mnt/upload/client_file

