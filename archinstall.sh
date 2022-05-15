timedatectl set-ntp true
mkfs.fat -F 32 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt
mount /dev/sda1 /mnt/boot

pacstrap /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/Asia/Kolkata /stc/localtime
hwclock --systohc
sed 's/#en_US.UTF-8/en_US.UTF-8' /etc/locale.gen
locale-gen

echo LANG=en_US.UTF-8 > /etc/locale.conf
echo spandy > /etc/hostname

