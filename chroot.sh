ln -sf /usr/share/zoneinfo/Europe/Helsinky /etc/localtime

hwclock --systohc

Ised -i "s/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen

locale-gen

tee -a /etc/hosts <<EOT
127.0.0.1	localhost
::1		localhost
127.0.1.1	paulsrv.localdomain paulsrV
EOT

echo KEYMAP=dvorak >> /etc/vconsole.conf
echo LANG=en_US.UTF-8 >> /etc/locale.conf
echo paulsrv >> /etc/hostname

pacmat -S grub efibootmgr vim git networkmanager mtools dosfstools os-prober
