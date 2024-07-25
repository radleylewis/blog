# Arch Install [btrfs + encryption]

1. Download the Arch ISO
2. Write the Arch ISO to a media device (e.g. USB)
3. Insert the USB into the target device and boot into Arch
4. Create a passwd with `passwd`
5. Ensure that `ssh` is running with `systemctl status sshd`
6. Connect to the internet with `iwctl`
7. Check your connection with `ping`
8. Obtain your IP Address with `ip addr show`
9. ssh into your machine from another machine (optional)
10. list your partitions with `lsblk`
11. delete the existing partitions (WARNING: your data will be lost)
12. create two partitions (no swap because we will use zram):
- efi = 300mb
- main = remainder (btrfs doesn't require sub-partitioning)
13. format your efi and swap partitions:
- efi: `mkfs.fat -F32 /dev/nvme0n1p1`
14. format your main partition:
- setup encryption: `cryptsetup luksformat /dev/nvme0n1p3`
- open your encrypted partition: `cryptsetup luksOpen /dev/nvme0n1p3 cryptroot`
- format your partition: `mkfs.btrfs /dev/mapper/cryptroot`
- mount your cryptroot partition for installation: `mount /dev/mapper/cryptroot /mnt`
- now we need into the `/mnt` directory with `cd /mnt`
- create our subvolumes:
> root: `btrfs subvolume create @`
> home: `btrfs subvolume create @home`
- go back to the original (root) directory with `cd`
- unmount our mnt partition: `umount /mnt`
- create our boot and home mounting points `mkdir /mnt/{boot,home}`
- mount our subvolumes: `mount -o noatime,compress=zstd,space_cache=v2,discard=async,subvol=@ /dev/mapper/cryptroot /mnt`
- mount our subvolumes: `mount -o noatime,compress=zstd,space_cache=v2,discard=async,subvol=@home /dev/mapper/cryptroot /mnt/home`
15. mount our efi partition with `mount /dev/nvme0np1 /mnt/boot`
16. install packages: `pacstrap /mnt base`
17. generate the file system table: `genfstab -U -p /mnt >> /mnt/etc/fstab` (you can check this with `cat /mnt/etc/fstab`
18. change root into the new system: `arch-chroot /mnt`
19. Now you are in your system (see `#` on prompt)
20. set your root password: `passwd`
21. create a user `useradd -m -g users -G wheel rad` then `passwd rad`
22. add your user to the sudoers group: `echo "rad ALL=(ALL) ALL" >> /etc/sudoers.d/rad`
23. install some packages `pacman -Syu base-devel linux linux-headers linux-firmware btrfs-progs intel-ucode (or amd-ucode)grub efibootmgr qtile mtools networkmanager lightdm lightdm-gtk-greeter xorg openssh sudo neovim git man-db man-pages texinfo bluez bluez-utils pipewire pipewire-alsa pipewire-pulse ttf-firacode-nerd alacritty firefox pipewire-jack iptables-nft ipset firewalld reflector `
24. edit the mkinitcpio file for encrypt: `nvim /etc/mkinitcpio.conf` and search for HOOKS, add encrypt (before filesystems hook)
25. recreate the `mkinitcpio -p linux`
26. setup grub for the bootloader so that the system can boot linux:
- `grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB`
- `grub-mkconfig -o /boot/grub/grub.cfg`
- run blkid and get the UUID for the main partitin: `blkid`
- edit the grub config `nvim /etc/default/grub`
- `GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet cryptdevice=UUID=d33844ad-af1b-45c7-9a5c-cf21138744b4:cryptroot root=/dev/mapper/cryptroot`
- make the grub config with `grub-mkconfig -o /boot/grub/grub.cfg`
27. locale `nvim /etc/locale.gen` uncomment your locale, write and exit and then run `locale-gen`
28. enable services:
- network manager with `systemctl enable NetworkManager`
- bluetooth with `systemctl enable bluetooth`
- ssh with `systemctl enable bluetooth`
- lightdm login manager with `systemctl enable lightdm.service`
- firewall with `systemctl enable firewalld`
- 
30. set the timezone:
- `ln -sf /usr/share/zoneinfo/Asia/Bangkok /etc/localtime`
- timedatectl set-ntp true
- hwclock --systohc
31. change the hostname `echo "arch" >> /etc/x1`
32. set mirrorlist `sudo reflector -c Switzerland -a 12 --sort rate --save /etc/pacman.d/mirrorlist`

TODO:  keyboard layout
NOTE: you can remove the swapfile setup and explore zram.
NOTE: install sof-firmware for the x1 carbon audio to work, install pavucontrol for alsamixer volume control. 
