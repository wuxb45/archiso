#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /usr/bin/bash root
cp -aT /etc/skel/ /root/
chmod 700 /root

#sed -i 's/#\(PermitRootLogin \)no/\1yes/' /etc/ssh/sshd_config
#sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.origin
echo 'Server = http://fbhead/mirror/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

systemctl enable pacman-init.service sshd.service
systemctl set-default multi-user.target

pacman -R --noconfirm vi
#ln -s /usr/bin/vim /usr/bin/vi

useradd -m archiso
chpasswd <<END
root:archiso
archiso:archiso
END
