#!/bin/bash

echo

fd=$fd

# Detect package manager and set "install" to packager manager install command
if test -f "/etc/arch-release"; then
  install=$"sudo pacman -S"
  noconfirm=$"--noconfirm"
  sudo pacman -Syu --noconfirm > /dev/null
elif test -f "/etc/debian_version"; then
  install=$"sudo apt-get install"
  noconfirm=$"-y"
  fd=$fdclone
  sudo apt-get upgrade > /dev/null
elif test -f "/etc/redhat-release"; then
  install=$"sudo yum install"
elif test -f "/etc/gentoo-release"; then
  install=$"sudo emerge install"
elif test -f "/etc/SuSE-release"; then
  install=$"sudo zypper install"
fi

sleep 0.25
sleep 0.25

$install $noconfirm git neovim $fd lolcat ranger > /dev/null

# Detects if npm is installed
if test -f "/usr/bin/npm"; then
else
  $install npm $noconfirm > /dev/null
fi
# Installs language servers
sudo npm i pyright bash-language-server > /dev/null

# Here begins the installation of the actual config
if test -f "~/.config/nvim"; then
  rm -r ~/.config/nvim > /dev/null
  git clone https://github.com/flunkyDoge/nvim-config.git ~/.config/nvim > /dev/null
else
  git clone https://github.com/flunkyDoge/nvim-config.git ~/.config/nvim > /dev/null
fi
sleep 0.15
nvim -c PlugInstall -c q! -c q! > /dev/null
