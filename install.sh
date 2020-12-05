loadkeys dvorak
timedatectl set-ntp true
if [[ -z /dev/mapper/cryptroot ]]; then
    cryptsetup open /dev/nvme0n1p2 cryptroot
fi

if [[ -z "$(ls -A /mnt)" ]]; then
    mount /dev/mapper/cryptroot /mnt
    
    if [[ -z /mnt/efi || -z "$(ls -A /mnt/efi)" ]]; then
        mkdir -p /mnt/efi
        mount /dev/nvme0n1p1 /mnt/efi
    fi
    
    if [[ -z /dev/mapper/crypthome ]]; then
        cryptsetup open /dev/nvme0n1p3 crypthome
    fi
    if [[ -z /mnt/home || -z "$(ls -A /mnt/home)" ]]; then
        mkdir -p /mnt/home
        mount /dev/mapper/crypthome /mnt/home
    fi
    
fi
