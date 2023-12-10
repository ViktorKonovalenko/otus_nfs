#!/bin/bash
yum install nfs-utils -y
echo "192.168.56.10:/srv/share/ /mnt nfs vers=3,proto=udp,noauto,x-systemd.automount 0 0" >> /etc/fstab
systemctl enable firewalld --now
systemctl daemon-reload
systemctl restart remote-fs.target
touch /mnt/upload/client_file

