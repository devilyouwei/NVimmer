#!/bin/bash

#node_version='13/stable'
source colors.sh

green " _   ___     ___                               "
green "| \\ | \\ \\   / (_)_ __ ___  _ __ ___   ___ _ __ "
green "|  \\| |\\ \\ / /| | '_ \` _ \\| '_ \` _ \\ / _ \\ '__|"
green "| |\\  | \\ V / | | | | | | | | | | | |  __/ |   "
green "|_| \\_|  \\_/  |_|_| |_| |_|_| |_| |_|\\___|_|"

green "Welcome to NVimmer, Make your NeoVim/Vim perform as an IDE!!!"
blue "Email: devilyouwei@gmail.com"
byellow "Waiting for installing, 3 seconds..."

sleep 3

echo ""
echo "Check snap-------------------------------------------------"
snap --version
status=$?
if [ "$status" != 0 ]; then
    echo "Install Snap..."
    sudo apt install snapd
    export PATH=$PATH:/snap/bin
fi
echo "-----------------------------------------------------------"
echo ""
sleep 1

echo "Check NeoVim-----------------------------------------------"
nvim -v
status=$?
if [ "$status" != 0 ]; then
    echo "Install NeoVim..."
    sudo snap install --beta nvim --classic
fi
echo "-----------------------------------------------------------"
echo ""
sleep 1

echo "Check Node.js----------------------------------------------"
node -v
status=$?
if [ "$status" != 0 ]; then
    echo "Install Node.js..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm install stable
fi
echo "-----------------------------------------------------------"
echo ""
sleep 1

echo "Check Python (both 2 and 3)--------------------------------"
python --version
status=$?
if [ "$status" != 0 ]; then
    echo "Install Python2..."
    sudo apt install python
fi

python3 --version
status=$?
if [ "$status" != 0 ]; then
    echo "Install Python3..."
    sudo apt install python3
fi
echo "-----------------------------------------------------------"
echo ""
sleep 1

echo "Check Perl-------------------------------------------------"
perl -v
status=$?
if [ "$status" != 0 ]; then
    echo "Install Perl..."
    sudo apt install perl
fi
echo "-----------------------------------------------------------"
echo ""
sleep 1

echo "Check Ruby-------------------------------------------------"
ruby -v
status=$?
if [ "$status" != 0 ]; then
    echo "Install ruby..."
    sudo apt install ruby
fi
echo "-----------------------------------------------------------"
echo ""
sleep 1

echo "Install NeoVim Providers-----------------------------------"
echo ""
echo "Node:"
npm -v
status=$?
if [ "$status" -eq 0 ]; then
    npm -g install neovim
fi

echo ""
echo "Python2:"
sudo apt install python-pip
pip --version
status=$?
if [ "$status" -eq 0 ]; then
    pip install neovim
fi

echo ""
echo "Python3:"
sudo apt install python3-pip
pip3 --version
status=$?
if [ "$status" -eq 0 ]; then
    pip3 install neovim
fi

echo ""
echo "Ruby:"
gem -v
status=$?
if [ "$status" -eq 0 ]; then
    sudo apt install ruby-dev
    sudo gem install neovim
fi

echo ""
echo "Perl:"
sudo apt install cpanminus
cpanm -v
if [ "$status" -eq 0 ]; then
    sudo cpanm Neovim::Ext
fi
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install ESLint--------------------------------------------"
eslint -v
status=$?
if [ "$status" != 0 ]; then
    echo "Install eslint..."
    npm -g install eslint
fi
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install Astyle--------------------------------------------"
sudo apt install astyle
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install Ctags---------------------------------------------"
sudo apt install ctags
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install the other formatters------------------------------"
sudo apt install clang-format
sudo snap install shfmt
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
sudo apt autoremove
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install NeoVim Plugins------------------------------------"
nvim -c PlugInstall -c q -c q
echo "Exit NeoVim..."
echo "All the plugins are installed!"
echo "----------------------------------------------------------"
echo ""
sleep 1

echo ""
echo "-------------------------------------------------------end"
echo 'Enjoy! ( ￣▽ ￣)～■ *Cheers*□～(￣▽ ￣)'

echo ""
echo "--------------------NVimmer-------------------------------"
green " _   ___     ___                               "
green "| \\ | \\ \\   / (_)_ __ ___  _ __ ___   ___ _ __ "
green "|  \\| |\\ \\ / /| | '_ \` _ \\| '_ \` _ \\ / _ \\ '__|"
green "| |\\  | \\ V / | | | | | | | | | | | |  __/ |   "
green "|_| \\_|  \\_/  |_|_| |_| |_|_| |_| |_|\\___|_|"

echo "-------------------------Favour---------------------------"
echo '(๑•̀ ㅂ•́ )و ✧ Like NVimmer? Go to:'
echo ""
blue 'https://github.com/devilyouwei/NVimmer'
yellow '☆ ☆ ☆ ☆ ☆ '
echo ""
red 'Remeber to restart the terminal or reconnect to the server, then type nvim!'
echo ""
