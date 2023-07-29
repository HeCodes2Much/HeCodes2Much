---
layout: 'post'
title: 'Install Debian 12'
date: '2023-07-29'
categories:
- 'Install'
tags:
- 'install'
- 'debian'
- 'linux'
- 'july'
- '2023'
author: wayne6324@gmail.com
author_profile: true
draft: false
---

# How to Install Debian 12

In this guide, we will walk you through the step-by-step process of installing Debian 12, the latest stable release of the Debian operating system. Debian is known for its stability, security, and extensive package repositories, making it a popular choice for both beginners and experienced users.

## Before You Begin

Before you start the installation process, there are a few things you need to prepare:

1. **Download Debian 12 ISO**: Head to the official Debian website (https://www.debian.org) and download the Debian 12 ISO image that matches your system architecture.

2. **Create a Bootable USB Drive**: Use tools like Rufus (for Windows) or Etcher (for macOS and Linux) to create a bootable USB drive from the downloaded ISO.

3. **Backup Your Data**: Installing a new operating system could lead to data loss, so it's essential to back up your important files before proceeding.

## Installation Steps

1. **Boot from USB Drive**:
   Insert the bootable USB drive into your computer and restart it. Make sure to set the USB drive as the primary boot device in your BIOS or UEFI settings.

2. **Choose Install Option**:
   When the Debian installer boots up, you'll be presented with a menu. Select the "Install" option to begin the installation process.

3. **Select Language**:
   Choose your preferred language for the installation process and click "Continue."

4. **Configure Localization**:
   Set your country, locale, and keyboard layout accordingly.

5. **Network Configuration**:
   Configure your network settings if you need an internet connection during the installation process.

6. **Set Hostname**:
   Enter a hostname for your Debian system and click "Continue."

7. **Set Root Password**:
   Choose a strong password for the root user. Remember this password as it will provide administrative privileges.

8. **Create User Account**:
   Create a standard user account by providing a username and password. This account will be used for everyday tasks.

9. **Partition Disks**:
   Configure disk partitions. You can choose to use the entire disk, set up partitions manually, or use guided partitioning.

10. **Confirm Disk Changes**:
    Review and confirm the disk partition changes before proceeding.

11. **Install the Base System**:
    The installer will now install the base system and necessary packages.

12. **Configure Package Manager**:
    Select a Debian software mirror for package installation and updates.

13. **Install Software**:
    Choose additional software to install. You can select from predefined software bundles or customize the selection.

14. **Install the GRUB Boot Loader**:
    The installer will prompt you to install the GRUB boot loader. Confirm the installation on the master boot record.

15. **Complete Installation**:
    Once the installation is complete, remove the installation media (USB drive) and reboot the system.

16. **Login to Debian 12**:
    After rebooting, you'll be greeted with the Debian login screen. Enter the username and password you created during the installation.

Congratulations! You have successfully installed Debian 12 on your system. Enjoy the stability and versatility of this excellent Linux distribution.

Remember to keep your system updated by running regular updates and enjoy exploring the vast world of Debian software!