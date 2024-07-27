📍Chiang Mai, Thailand

###### 27 July 2024

# Arch Install [btrfs + encryption + zram + qtile]

Good morning, good afternoon or good evening, whereever you are reading this from. These installation instructions form the foundation of the Arch system that I use on my own machine. While it's important to always consult the official Arch wiki install guide [here](https://wiki.archlinux.org/title/Installation_guide), but sometimes you may find your preferences deviating from the the official guide, and so my intention here is to provide a walkthrough on setting up your own system with the following:
- [btrfs](https://btrfs.readthedocs.io/en/latest/): A feature rich, copy-on-write filesystem for Linux.
- [LUKS](https://gitlab.com/cryptsetup/cryptsetup/):  disk encryption based on the dm-crypt kernel module.
- [zram](https://www.kernel.org/doc/html/v5.9/admin-guide/blockdev/zram.html): RAM compression for memory savings.
- [timeshift](https://github.com/linuxmint/timeshift): A system restore tool for Linux.
- [QTile](https://qtile.org/): A full-featured, hackable tiling window manager written and configured in Python.

My intention is to keep this guide up-to-date, and any feedback is more than welcome. Let's get started.

## Step 1: Creating a bootable Arch media device

Here we will follow the Arch wiki:
1. Acquire an installation image [here](https://archlinux.org/download/).
2. Verify the signature on the downloaded Arch ISO image (1.2 of the installation guide).
3. Write your ISO to a USB (check out [this]([guide](https://www.scaler.com/topics/burn-linux-iso-to-usb/) guide)
4. Insert the USB into the device you intend to install Arch linux on and boot into the USB.

## Step 2: Setting Up Our System with the Arch ISO

1. [optional] if you would like to ssh into your target machine you will need to:
   - Create a password for the ISO root user with the `passwd` command; and,
   - Ensure that `ssh` is running with `systemctl status sshd` (if it isn't start it with `systemctl start ssdhd`).
2. Set the console keybooard layout (US by default):
   - list available keymaps with `localectl list-keymaps`; and,
   - load the keymap with `loadkeys <your keymap here>`.
3. [optional] set the font size with `setfont ter-132b`.
4. Verify the UEFI boot mode `cat /sys/firmware/efi/fw_platform_size`. This installation is written for a system with a 62-bit x64 UEFI. This isn't required, but if you are on a different boot mode, consult section 1.6 of the official guide.
5. Connect to the internet:
   - I use the `iwctl` utility for this purpose; 
   - Confirm that your connection is active with `ping -c 2 archlinux.org`; and,
6. [optional] Obtain your IP Address with `ip addr show`, and now you're ready to ssh into your target machine.
7. Set the timezone:
  - `timedatectl list-timezones`;
  - `timedatectl set-timezone Asia/Bangkok` (replace Asia/Bangkok with your preferred timezone); and,
  - `timedatectl set-ntp true`.
8. Partition your disk:
  - list your partitions with `lsblk`;
  - delete the existing partitions on the target disk [WARNING: your data will be lost]
  - create two partitions:
    **efi** = 300mb
    **main** = allocate all remaining space (or as otherwise fit for your specific case) noting that BTRFS doesn't require pre-defined partition sizes, but rather allocates dynamically through subvolumes which act in a similar fashion to partitions but don't require the physical division of the target disk. 
    > !NOTE: The official Arch Linux installation guide suggests implementing a swap partition and you are welcome to take this route. You could also create a swap subvolume within BTRFS, however, snapshots will be disabled where a volume has an active swapfile. In my case, I have opted instead of `zram` which works by compressing data in RAM, thereby stretching your RAM further.
13. format your efi partition:
- efi: `mkfs.fat -F32 /dev/nvme0n1p1`
- mount our efi partition with `mount /dev/nvme0np1 /mnt/boot`
14. format your main partition:
- setup encryption: `cryptsetup luksformat /dev/nvme0n1p3`
- open your encrypted partition: `cryptsetup luksOpen /dev/nvme0n1p3 main`
- format your partition: `mkfs.btrfs /dev/mapper/main`
- mount your main partition for installation: `mount /dev/mapper/main /mnt`
- now we need into the `/mnt` directory with `cd /mnt`
- create our subvolumes:
  **root**: `btrfs subvolume create @`
  **home**: `btrfs subvolume create @home`
- go back to the original (root) directory with `cd`
- unmount our mnt partition: `umount /mnt`
- create our boot and home mounting points `mkdir /mnt/{boot,home}`
- mount our subvolumes: `mount -o noatime,ssd,compress=zstd,space_cache=v2,discard=async,subvol=@ /dev/mapper/main /mnt`
- mount our subvolumes: `mount -o noatime,compress=zstd,space_cache=v2,discard=async,subvol=@home /dev/mapper/main /mnt/home`
16. install base packages: `pacstrap /mnt base`
17. generate the file system table: `genfstab -U -p /mnt >> /mnt/etc/fstab` (you can check this with `cat /mnt/etc/fstab`)
18. change root into the new system: `arch-chroot /mnt`
19. Now you are in your system (you will now see that your prompt is populated with a `#` symbol)



20. set your local time and locale on your system: 
- `ln -sf /usr/share/zoneinfo/Asia/Bangkok /etc/localtime` (this is in your system, not on the iso)
- `hwclock --systohc`
- locale `nvim /etc/locale.gen` uncomment your locale, write and exit and then run `locale-gen`
- `echo "LANG=en_US.UTF-8" >> /etc/locale.conf` for locale
- `echo "KEYMAP=en..." >> /etc/vconsole.conf` for keyboard
31. change the hostname `echo "arch" >> /etc/x1`
20. set your root password: `passwd`
21. create a user `useradd -m -g users -G wheel rad` then `passwd rad`
22. add your user to the sudoers group: `echo "rad ALL=(ALL) ALL" >> /etc/sudoers.d/rad`
32. set mirrorlist `sudo reflector -c Thailand -a 12 --sort rate --save /etc/pacman.d/mirrorlist`
23. install some packages `pacman -Syu base-devel linux linux-headers linux-firmware btrfs-progs intel-ucode (or amd-ucode)grub efibootmgr qtile mtools networkmanager network-manager-applet lightdm lightdm-gtk-greeter xorg openssh sudo neovim git man-db man-pages texinfo bluez bluez-utils pipewire alsa-utils pipewire pipewire-pulse pipewire-jack sof-firmware ttf-firacode-nerd alacritty firefox iptables-nft ipset firewalld reflector acpid grub-btrfs`
24. edit the mkinitcpio file for encrypt: `nvim /etc/mkinitcpio.conf` and search for HOOKS, add encrypt (before filesystems hook) and add `btrfs` to the modules. 
25. recreate the `mkinitcpio -p linux`
26. setup grub for the bootloader so that the system can boot linux:
- `grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB`
- `grub-mkconfig -o /boot/grub/grub.cfg`
- run blkid and get the UUID for the main partitin: `blkid`
- edit the grub config `nvim /etc/default/grub`
- `GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet cryptdevice=UUID=d33844ad-af1b-45c7-9a5c-cf21138744b4:cryptroot root=/dev/mapper/cryptroot`
- make the grub config with `grub-mkconfig -o /boot/grub/grub.cfg`
28. enable services:
- network manager with `systemctl enable NetworkManager`
- bluetooth with `systemctl enable bluetooth`
- ssh with `systemctl enable bluetooth`
- lightdm login manager with `systemctl enable lightdm.service`
- firewall with `systemctl enable firewalld`
- reflector `systemctl enable reflector.timer`
- systemctl enable fstrim.timer (ssd trimming)
- systemctl enable acpid (what is this?)
- systemctl enable btrfsd

32. set mirrorlist `sudo reflector -c Switzerland -a 12 --sort rate --save /etc/pacman.d/mirrorlist`
33. install paru, then zramd, timeshift, timeshift-autosnapshot, install timeshift-grub, cpu-autofreq
34. timeshift:
- `sudo timeshift --list-devices`
- `sudo timeshift --snapshot-device /dev/nvme1n1p3`
- `sudo timeshift --create --comments "[26JUL2024] fresh install" --tags W` (weekly)
- `sudo systemctl edit --full grub-btrfsd` and replace grub-btrfsd --syslog /.snapshots with grub-btrfsd --syslog -t [link](https://wiki.archlinux.org/title/Timeshift)
- `grub-mkconfig -o /boot/grub/grub.cfg`
