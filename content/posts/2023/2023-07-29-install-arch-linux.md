---
layout: 'post'
title: 'Install Arch Linux'
date: '2023-07-29'
category: 'Install'
tags:
- 'install'
- 'arch'
- 'linux'
author: wayne6324@gmail.com
author_profile: true
draft: false
---

# How to Install Arch Linux: A Comprehensive Guide

![Arch Linux Logo](https://upload.wikimedia.org/wikipedia/commons/a/a5/Archlinux-icon-crystal-64.svg)

If you're someone who enjoys the thrill of customizing your Linux system to your exact specifications, then Arch Linux might be the perfect distribution for you. Arch Linux is known for its simplicity, minimalism, and do-it-yourself approach, offering a rolling release model that ensures you always have access to the latest software packages. In this guide, we'll walk you through the step-by-step process of installing Arch Linux on your machine.

<!-- more -->

## Prerequisites

Before we dive into the installation process, make sure you have the following prerequisites:

1. A bootable USB drive with the Arch Linux ISO image.
2. A computer with at least 20 GB of free disk space.
3. A reliable internet connection.

## Step 1: Booting into the Arch Linux Live Environment

Insert your bootable USB drive into the computer and restart it. Enter the BIOS/UEFI settings and configure the boot order to prioritize the USB drive. Save your changes and reboot the computer. Arch Linux will load into the Live Environment.

## Step 2: Connect to the Internet

To install Arch Linux, you'll need an internet connection. You can use either an Ethernet connection or connect to a Wi-Fi network. For Wi-Fi, use the following command to list available networks:

```
iwctl station wlan0 scan
iwctl station wlan0 get-networks
iwctl station wlan0 connect <SSID>
```

Replace `<SSID>` with the name of your Wi-Fi network and enter the passphrase when prompted.

## Step 3: Partitioning the Disk

Now it's time to partition your disk. Arch Linux doesn't come with a graphical partitioning tool, so we'll use the `fdisk` utility. Type the following command to start partitioning your disk:

```
fdisk /dev/sdX
```

Replace `X` with the appropriate letter for your disk (e.g., `/dev/sda`).

1. Type `g` to create a new GPT partition table.
2. Type `n` to create a new partition.
3. Choose the partition type (usually primary) and set the partition size.
4. Repeat the previous steps if you want additional partitions (e.g., for /home or /var).

Once you've created all your partitions, type `w` to write the changes to disk.

## Step 4: Formatting the Partitions

After partitioning, you'll need to format the partitions. Here's how:

1. For the root partition (e.g., `/dev/sdX1`), use:

```
mkfs.ext4 /dev/sdX1
```

2. For other partitions (e.g., /home), use the appropriate file system type (e.g., `mkfs.ext4`, `mkfs.btrfs`, etc.).

## Step 5: Mounting the Partitions

Now, mount the root partition to `/mnt`:

```
mount /dev/sdX1 /mnt
```

If you created additional partitions, mount them accordingly. For example:

```
mkdir /mnt/home
mount /dev/sdX2 /mnt/home
```

## Step 6: Installing the Base System

It's time to install the base Arch Linux system. Use the following command to perform the installation:

```
pacstrap /mnt base linux linux-firmware
```

This will install the minimal essential packages needed to run Arch Linux.

## Step 7: Generating the Fstab

Generate the `fstab` file to define how disk partitions should be mounted at boot:

```
genfstab -U /mnt >> /mnt/etc/fstab
```

## Step 8: Chrooting into the New System

Now, change the root into the newly installed system:

```
arch-chroot /mnt
```

## Step 9: Configuring the System

The base system is installed, but there are still a few configurations to be made:

1. Set the time zone:

```
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
```

2. Run `hwclock` to generate `/etc/adjtime`:

```
hwclock --systohc
```

3. Uncomment the locale you want to use in `/etc/locale.gen`, and then generate the locale:

```
locale-gen
```

4. Create the `locale.conf` file and set the desired locale:

```
echo "LANG=en_US.UTF-8" > /etc/locale.conf
```

5. Set the hostname:

```
echo "myhostname" > /etc/hostname
```

6. Edit the `/etc/hosts` file and add the following lines:

```
127.0.0.1   localhost
::1         localhost
127.0.1.1   myhostname.localdomain   myhostname
```

7. Set the root password:

```
passwd
```

## Step 10: Installing the Boot Loader

To boot into Arch Linux, you'll need to install a boot loader. We'll use `systemd-boot`:

```
bootctl install
```

## Step 11: Rebooting

The installation is complete! Exit the chroot environment:

```
exit
```

Unmount all partitions:

```
umount -R /mnt
```

Then, restart your system:

```
reboot
```

## Welcome to Arch Linux!

Congratulations, you've successfully installed Arch Linux on your machine! Now you have a clean slate to build your personalized, minimalist Linux system. Enjoy exploring the vast world of Arch Linux and its incredible customization options!

Remember that Arch Linux requires some manual configuration and is designed for users who enjoy learning and customizing their systems. It's not the best choice for absolute beginners, but it can be a rewarding experience for those who seek full control over their Linux environment.

Happy hacking! :tada: