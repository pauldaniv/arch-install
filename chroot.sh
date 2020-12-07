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

pacmat -S grub efibootmgr vim git networkmanager mtools dosfstools os-prober linux-headers xdg-utils xdg-user-dirs dialog base-devel mesa intel-ucode sudo

useradd -mG wheel paul

passwd paul
passwd
# edit visudo

# vim mkinitcpio.conf
#add hooks -- HOOKS(base udev autodetect keyboard keymap modconf block encrypt keyboard fcsk)
# mkinitcpio -p linux
# grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
# grub-mkconfig -o /boot/grub/grub.cfg
#if using encryption, enable grub cmdline 
# blkid -s UUID -o value /dev/cryptsetup/cryptroot >> /etc/default/grub
#add line "cryptdevice=UUID=<UUID>:cryptroot root=/dev/mapper/cryptroot"
# grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager







