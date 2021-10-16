#!/bin/bash

echo

# For Yes and No inputs
function yes_or_no {
    while true; do
        read -p "$question [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo "Aborted, $abort is required!" ; exit  1 ;;
        esac
    done
}

fd=$fd

# Detect package manager and set 'install' to packager manager install command
if test -f '/etc/arch-release'; then
  echo "Package manager detected: pacman"
  install=$'sudo pacman -S'
  noconfirm=$'--noconfirm'
  sudo pacman -Syu --noconfirm
  echo
elif test -f '/etc/debian_version'; then
  echo "Package manager detected: apt-get"
  install=$'sudo apt-get install'
  noconfirm=$'-y'
  fd=$fdclone
  sudo apt-get update
  echo
elif test -f '/etc/redhat-release'; then
  echo "Package manager detected: yum"
  install=$'sudo yum install'
  echo
elif test -f '/etc/gentoo-release'; then
  echo "Package manager detected: emerge"
  install=$'sudo emerge install'
  echo
elif test -f '/etc/SuSE-release'; then
  echo "Package manager detected: zypper"
  install=$'sudo zypper install'
  echo
fi

question='Neovim is not installed, would you like to install it with required dependencies (fd, lua, lolcat, ranger) now?'
abort='Neovim and dependencies'
$install $noconfirm git neovim $fd lolcat ranger
echo

# Detects if npm is installed
echo "Checking if npm is installed, this is used for installing language servers"
if test -f '/usr/bin/npm'; then
  echo 'npm is already installed!'
else
  question='npm is not installed, would you like to install it now? [Y/n]'
  abort='npm'
  $install npm $noconfirm
fi

# Installs language servers
echo 'Installing required language servers'
sudo npm i pyright bash-language-server
echo

# Here begins the installation of the actual config
if test -f '~/.config/nvim'; then
  question='Neovim config found! Would you like to overwrite and create a backup (~/nvim-back)'
  abort='of course my Neovim config'
  rm -r ~/.config/nvim
  git clone https://github.com/flunkyDoge/nvim-config.git ~/.config/nvim
  echo
else
  echo 'Installing my Neovim config!'
  abort='of course my Neovim config'
  git clone https://github.com/flunkyDoge/nvim-config.git ~/.config/nvim
  echo
fi

nvim -c PlugInstall -c q! -c q!

echo 'My Neovim config is installed!'
