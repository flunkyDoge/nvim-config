#!/bin/bash

echo

fd=$fd

echo -ne "\n
Progress... [...................................................] (00%)\r"
sleep 0.1
echo -ne "Detecting package manager\n
Progress... [#..................................................] (02%)\r"
sleep 0.1
echo "Detecting package manager\n
Progress... [##.................................................] (04%)\r"
# Detect package manager and set "install" to packager manager install command
if test -f "/etc/arch-release"; then
  echo -ne "Package manager detected: pacman\n
Progress... [####...............................................] (08%)\r"
  install=$"sudo pacman -S"
  noconfirm=$"--noconfirm"
  sudo pacman -Syu --noconfirm > /dev/null
elif test -f "/etc/debian_version"; then
  echo -ne "Package manager detected: apt-get\n
Progress... [####...............................................] (08%)\r"
  install=$"sudo apt-get install"
  noconfirm=$"-y"
  fd=$fdclone
  sudo apt-get upgrade > /dev/null
elif test -f "/etc/redhat-release"; then
  echo -ne "Package manager detected: yum"
  install=$"sudo yum install"
elif test -f "/etc/gentoo-release"; then
  echo -ne "Package manager detected: emerge"
  install=$"sudo emerge install"
elif test -f "/etc/SuSE-release"; then
  echo -ne "Package manager detected: zypper"
  install=$"sudo zypper install"
fi

sleep 0.25
echo -ne "Set install variables\n
Progress... [######.............................................] (12%)\r"
sleep 0.25

echo -ne "Installing Neovim and dependencies\n
Progress... [########...........................................] (16%)\r"
$install $noconfirm git neovim $fd lolcat ranger > /dev/null

sleep 0.1
echo -ne "Installing Neovim and dependencies\n
Progress... [##########.........................................] (20%)\r"
sleep 0.1
echo -ne "Installing Neovim and dependencies\n
Progress... [##############.....................................] (26%)\r"
sleep 0.1
echo -ne "Dependencies installed\n
Progress... [################...................................] (30%)\r"

# Detects if npm is installed
echo -ne "Checking if npm is installed, this is used for installing language servers\n
Progress... [##################.................................] (35%)\r"
sleep 0.25
echo -ne "Checking if npm is installed, this is used for installing language servers\n
Progress... [####################...............................] (38%)\r"
if test -f "/usr/bin/npm"; then
  echo -ne "Npm is already installed\n
  Progress... [######################.............................] (42%)\r"
  sleep 0.15
  echo -ne "Npm is already installed\n
  Progress... [########################...........................] (46%)\r"
else
  sleep 0.25
  echo -ne "Npm is not installed, installing\n
  Progress... [######################.............................] (42%)\r"
  $install npm $noconfirm > /dev/null
  echo -ne "Npm successfuly installed\n
  Progress... [########################...........................] (46%)\r"
fi

sleep 0.2
echo -ne "Npm is installed\n
Progress... [#########################..........................] (48%)\r"
sleep 0.15
echo -ne "Installing required language servers\n
Progress... [##########################.........................] (50%)\r"
# Installs language servers
echo -ne "Installing required language servers\n
Progress... [#############################......................] (56%)\r"
sudo npm i pyright bash-language-server > /dev/null
echo -ne "Language servers successfuly installed\n
Progress... [################################...................] (62%)\r"
sleep 0.2 
echo -ne "Language servers successfuly installed\n
Progress... [###################################................] (68%)\r"
sleep 0.15
echo -ne "Checking for pre-existing ~/.config/nvim\n
Progress... [######################################.............] (74%)\r"
sleep 0.2
echo -ne "Checking for pre-existing ~/.config/nvim\n
Progress... [########################################...........] (78%)\r"
sleep 0.1

# Here begins the installation of the actual config
if test -f "~/.config/nvim"; then
  echo -ne "Nvim config found, deleting\n
  Progress... [##########################################.........] (82%)\r"
  rm -r ~/.config/nvim > /dev/null
  sleep 0.15
  echo -ne "Nvim config deleted, cloning Nvim config\n
  Progress... [############################################.......] (86%)\r"
  git clone https://github.com/flunkyDoge/nvim-config.git ~/.config/nvim > /dev/null
  echo -ne "Nvim config successfuly cloned\n
  Progress... [##############################################.....] (90%)\r"
else
  echo -ne "No Nvim config found\n
  Progress... [##########################################.........] (82%)\r"
sleep 0.15
  echo -ne "Cloning Neovim config\n
  Progress... [############################################.......] (86%)\r"
  git clone https://github.com/flunkyDoge/nvim-config.git ~/.config/nvim > /dev/null
  echo -ne "Nvim config successfuly cloned\n
  Progress... [##############################################.....] (90%)\r"
fi
sleep 0.2 
echo -ne "Nvim config successfuly cloned\n
Progress... [###############################################....] (92%)\r"
sleep 0.15
echo -ne "Installing plugins for Nvim\n
Progress... [################################################...] (94%)\r"
nvim -c PlugInstall -c q! -c q! > /dev/null
echo -ne "Plugins installed!\n
Progress... [##################################################.] (98%)\r"

echo -ne "Neovim config is installed!\n
Progress... [###################################################] (100%)\r"
