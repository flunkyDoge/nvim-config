#!/bin/bash

echo

fd=$fd

echo '
Progress... [...................................................] (00%)'
sleep 0.1
echo 'Detecting package manager
Progress... [#..................................................] (02%)'
sleep 0.1
echo 'Detecting package manager
Progress... [##.................................................] (04%)'
# Detect package manager and set 'install' to packager manager install command
if test -f '/etc/arch-release'; then
  echo "Package manager detected: pacman
Progress... [####...............................................] (08%)"
  install=$'sudo pacman -S'
  noconfirm=$'--noconfirm'
  sudo pacman -Syu --noconfirm > /dev/null
  echo
elif test -f '/etc/debian_version'; then
  echo "Package manager detected: apt-get
Progress... [####...............................................] (08%)"
  install=$'sudo apt-get install'
  noconfirm=$'-y'
  fd=$fdclone
  sudo apt-get upgrade > /dev/null
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

sleep 0.25
echo 'Set install variables
Progress... [######.............................................] (12%)'
sleep 0.25

echo 'Installing Neovim and dependencies
Progress... [########...........................................] (16%)'
$install $noconfirm git neovim $fd lolcat ranger > /dev/null
echo

sleep 0.1
echo 'Installing Neovim and dependencies
Progress... [##########.........................................] (20%)'
sleep 0.1
echo 'Installing Neovim and dependencies
Progress... [##############.....................................] (26%)'
sleep 0.1
echo 'Dependencies installed
Progress... [################...................................] (30%)'

# Detects if npm is installed
echo "Checking if npm is installed, this is used for installing language servers
Progress... [##################.................................] (35%)"
sleep 0.25
echo "Checking if npm is installed, this is used for installing language servers
Progress... [####################...............................] (38%)"
if test -f '/usr/bin/npm'; then
  echo 'Npm is already installed
Progress... [######################.............................] (42%)'
  sleep 0.15
  echo 'Npm is already installed
Progress... [########################...........................] (46%)'
else
  sleep 0.25
  echo 'Npm is not installed, installing
Progress... [######################.............................] (42%)'
  $install npm $noconfirm > /dev/null
  echo 'Npm successfuly installed
Progress... [########################...........................] (46%)'
fi

sleep 0.2
echo 'Npm is installed
Progress... [#########################..........................] (48%)'
sleep 0.15
echo 'Installing required language servers
Progress... [##########################.........................] (50%)'
# Installs language servers
echo 'Installing required language servers
Progress... [#############################......................] (56%)'
sudo npm i pyright bash-language-server > /dev/null
echo 'Language servers successfuly installed
Progress... [################################...................] (62%)'
sleep 0.2 
echo 'Language servers successfuly installed
Progress... [###################################................] (68%)'
sleep 0.15
echo 'Checking for pre-existing ~/.config/nvim 
Progress... [######################################.............] (74%)'
sleep 0.2
echo 'Checking for pre-existing ~/.config/nvim 
Progress... [########################################...........] (78%)'
sleep 0.1

# Here begins the installation of the actual config
if test -f '~/.config/nvim'; then
  echo 'Nvim config found, deleting
Progress... [##########################################.........] (82%)'
  rm -r ~/.config/nvim
  sleep 0.15
  echo 'Nvim config deleted, cloning Nvim config
Progress... [############################################.......] (86%)'
  git clone https://github.com/flunkyDoge/nvim-config.git ~/.config/nvim
  echo 'Nvim config successfuly cloned
Progress... [##############################################.....] (90%)'
else
  echo 'No Nvim config found
Progress... [##########################################.........] (82%)'
sleep 0.15
  echo 'Cloning Neovim config 
Progress... [############################################.......] (86%)'
  git clone https://github.com/flunkyDoge/nvim-config.git ~/.config/nvim
  echo 'Nvim config successfuly cloned
Progress... [##############################################.....] (90%)'
fi
sleep 0.2 
echo 'Nvim config successfuly cloned 
Progress... [###############################################....] (92%)'
sleep 0.15
echo 'Installing plugins for Nvim
Progress... [################################################...] (94%)'
nvim -c PlugInstall -c q! -c q!
echo 'Plugins installed!
Progress... [##################################################.] (98%)'

echo 'Neovim config is installed!
Progress... [###################################################] (100%)'
