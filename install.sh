loadkeys dvorak
timedatectl set-ntp true
if [[ -z /dev/mapper/cryptroot ]]; then
    cryptsetup open /dev/nvme0n1p2 cryptroot
fi
mount /dev/mapper/cryptroot /mnt
mkdir -p /mnt/boot
mount /dev/nvme0n1p1 /mnt/efi
if [[ -z /dev/mapper/crypthome ]]; then
    cryptsetup open /dev/nvme0n1p3 crypthome
fi
mkdir -p /mnt/home
mount /dev/mapper/crypthome /mnt/home
