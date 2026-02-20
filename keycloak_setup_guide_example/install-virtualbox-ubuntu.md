# Install VirtualBox and Setup Ubuntu (Debian/Trixie)

This guide explains how to install VirtualBox and set up Ubuntu 24.04.4
on Debian/Trixie.

------------------------------------------------------------------------

## Step 1: Download VirtualBox (.deb file)

Download VirtualBox 7.2.6 for Debian:

https://download.virtualbox.org/virtualbox/7.2.6/virtualbox-7.2_7.2.6-172322~Debian~trixie_amd64.deb

Or download using wget:

``` bash
wget https://download.virtualbox.org/virtualbox/7.2.6/virtualbox-7.2_7.2.6-172322~Debian~trixie_amd64.deb
```

------------------------------------------------------------------------

## Step 2: Install VirtualBox

Navigate to the directory where the file was downloaded and run:

``` bash
sudo apt update
sudo apt install ./virtualbox-7.2_7.2.6-172322~Debian~trixie_amd64.deb
```

If dependency issues occur, run:

``` bash
sudo apt --fix-broken install
```

------------------------------------------------------------------------

## Step 3: Download Ubuntu ISO

Download Ubuntu 24.04.4 Desktop ISO:

https://releases.ubuntu.com/24.04.4/ubuntu-24.04.4-desktop-amd64.iso

Or download using wget:

``` bash
wget https://releases.ubuntu.com/24.04.4/ubuntu-24.04.4-desktop-amd64.iso
```

------------------------------------------------------------------------

## Step 4: Open VirtualBox

Run the following command:

``` bash
virtualbox
```

Or open it from your Applications menu.

------------------------------------------------------------------------

## Step 5: Create and Configure Ubuntu Virtual Machine

1.  Click **New**
2.  Name: `Ubuntu 24.04`
3.  Type: `Linux`
4.  Version: `Ubuntu (64-bit)`
5.  Allocate RAM: **4096 MB (4GB) or more recommended**
6.  Allocate CPU: **2 or more cores recommended**
7.  Create Virtual Hard Disk:
    -   Type: `VDI`
    -   Storage: `Dynamically allocated`
    -   Size: **20GB or more recommended**
8.  Select the downloaded Ubuntu ISO file when prompted
9.  Click **Start**

------------------------------------------------------------------------

## Step 6: Install Ubuntu

1.  Select **Install Ubuntu**
2.  Choose keyboard layout
3.  Select **Normal installation**
4.  Choose **Erase disk and install Ubuntu** (this only affects the
    virtual disk)
5.  Create username and password
6.  Wait for installation to complete
7.  Restart the virtual machine

------------------------------------------------------------------------

## Installation Complete 🎉

Ubuntu is now running inside VirtualBox.
