#!/bin/bash

#node_version='13/stable'

echo " _   ___     ___                               "
echo "| \\ | \\ \\   / (_)_ __ ___  _ __ ___   ___ _ __ "
echo "|  \\| |\\ \\ / /| | '_ \` _ \\| '_ \` _ \\ / _ \\ '__|"
echo "| |\\  | \\ V / | | | | | | | | | | | |  __/ |   "
echo "|_| \\_|  \\_/  |_|_| |_| |_|_| |_| |_|\\___|_|"

echo "Welcome to NVimmer, Make your NeoVim/Vim perform as an IDE!!!"
echo "Email: devilyouwei@gmail.com"
echo "Waiting for installing, 3 seconds..."

sleep 3

echo "Check snap------------------------------------------------"
(snap --version)
status=$?
if [ "$status" != 0 ]; then
    echo "Install Snap..."
    (sudo apt install snapd)
    export PATH=$PATH:/snap/bin
fi
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Check NeoVim----------------------------------------------"
(nvim -v)
status=$?
if [ "$status" != 0 ]; then
    echo "Install NeoVim..."
    (sudo snap install --beta nvim --classic)
fi
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Check Node.js---------------------------------------------"
(node -v)
status=$?
if [ "$status" != 0 ]; then
    echo "Install Node.js..."
    (sudo apt install nodejs npm)
fi
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Check Python (both 2 and 3)-------------------------------"
(python --version)
status=$?
if [ "$status" != 0 ]; then
    echo "Install Python2 with pip..."
    (sudo apt install python)
    (sudo apt install python-pip)
fi

(python3 --version)
status=$?
if [ "$status" != 0 ]; then
    echo "Install Python3 with pip..."
    (sudo apt install python3)
    (sudo apt install python3-pip)
fi
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Check Perl-------------------------------------------------"
(perl -v)
status=$?
if [ "$status" != 0 ]; then
    echo "Install Perl..."
    (sudo apt install perl)
fi
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install NeoVim Providers-----------------------------------"
echo "Node:"
(npm -v)
status=$?
if [ "$status" -eq 0 ]; then
    (npm -g install neovim)
fi
echo "\nPython2:"
(pip --version)
status=$?
if [ "$status" -eq 0 ]; then
    (pip install neovim)
fi
echo "\nPython3:"
(pip3 --version)
status=$?
if [ "$status" -eq 0 ]; then
    (pip3 install neovim)
fi
echo "\nRuby:"
(gem -v)
status=$?
if [ "$status" -eq 0 ]; then
    (gem install neovim)
fi
echo "\nPerl:"
(sudo apt install cpanm)
(cpanm -v)
if [ "$status" -eq 0 ]; then
    (cpanm Neovim::Ext)
fi
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install ESLint--------------------------------------------"
(eslint -v)
status=$?
if [ "$status" != 0 ]; then
    echo "Install eslint..."
    (npm -g install eslint)
fi
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install Astyle--------------------------------------------"
(sudo apt install astyle)
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install Ctags---------------------------------------------"
(sudo apt install ctags)
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install the other formatters------------------------------"
(sudo apt install clang-format)
(sudo snap install shfmt)
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Copy and Config Your NeoVim-------------------------------"
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi
cp -rf ./nvim/ ~/.config/
cp ./.eslintrc.json ~/
cp ./.prettierrc.json ~/
echo "Config successfully!"
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install vim-plug------------------------------------------"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Clean trash and packages----------------------------------"
(sudo apt autoremove)
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install NeoVim Plugins------------------------------------"
(nvim -c PlugInstall)
echo "----------------------------------------------------------"
echo ""
sleep 1

echo ""
echo "-------------------------------------------------------end"
echo "Enjoy!"
