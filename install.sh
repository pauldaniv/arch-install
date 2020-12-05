loadkeys dvorak
timedatectl set-ntp true
cryptsetup open /dev/nvme0n1p2 cryptroot
mount /dev/mapper/cryptroot /mnt
mkdir /mnt/boot
mount /dev/nvm0n1p1 /mnt/efi
cryptsetup open /dev/nvm0n1p3 crypthome
mkdir /mnt/home
mount /dev/mapper/crypthome /mnt/home
