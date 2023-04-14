#!/bin/bash

sudo apt update
sudo apt full-upgrade
sudo apt install linux-headers-generic build-essential dkms git
git clone https://github.com/clnhub/rtl8192eu-linux.git

sudo rmmod 8192eu
sudo rmmod rtl8xxxu
sudo dkms remove -m rtl8192eu -v 1.0
echo "blacklist rtl8xxxu" >> ./blacklist-rtl8xxxu.conf
sudo mv ./blacklist-rtl8xxxu.conf /etc/modprobe.d/
sudo cp -ar . /usr/src/rtl8192eu-1.0
sudo dkms add -m rtl8192eu -v 1.0
sudo dkms install -m rtl8192eu -v 1.0
sudo modprobe 8192eu

sudo apt install zsh
sudo chsh -s zsh

sudo apt install tmux
sudo apt install tilix
sudo snap remove firefox

sudo add-apt-repository ppa:lyzardking/ubuntu-make
sudo apt update
sudo apt install ubuntu-make
sudo umake web firefox-dev

