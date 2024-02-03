#!/bin/env bash

systemctl enable nfs
systemctl start nfs
firewall-cmd --add-service="nfs3" \
--add-service="rpc-bind" \
--add-service="mountd" \
--add-service="ssh"
--permanent 
firewall-cmd --reload
mkdir -v -p /srv/share/upload
chown -R nfsnobody:nfsnobody /srv/share
chmod 0777 /srv/share/upload
cat << EOF > /etc/exports 
/srv/share 192.168.50.11/32(rw,sync,root_squash)
EOF
exportfs -r
touch /srv/share/upload/check_file