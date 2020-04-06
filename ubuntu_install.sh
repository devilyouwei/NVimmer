#!/bin/bash

#node_version=13
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
echo "Check curl-------------------------------------------------"
curl --version
status=$?
if [ "$status" != 0 ]; then
    echo "Install Curl..."
    sudo apt install -y curl
fi
echo "-----------------------------------------------------------"
echo ""
sleep 1

echo ""
echo "Check snap-------------------------------------------------"
snap --version
status=$?
if [ "$status" != 0 ]; then
    echo "Install Snap..."
    sudo apt install -y snapd
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
    if [ "$?" != 0 ]; then
        sudo apt install -y software-properties-common
        sudo add-apt-repository ppa:neovim-ppa/stable -y
        sudo apt update -y
        sudo apt install -y neovim
    fi
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
    sudo apt install -y python
fi

python3 --version
status=$?
if [ "$status" != 0 ]; then
    echo "Install Python3..."
    sudo apt install -y python3
fi
echo "-----------------------------------------------------------"
echo ""
sleep 1

echo "Check Perl-------------------------------------------------"
perl -v
status=$?
if [ "$status" != 0 ]; then
    echo "Install Perl..."
    sudo apt install -y perl
fi
echo "-----------------------------------------------------------"
echo ""
sleep 1

echo "Check Ruby-------------------------------------------------"
ruby -v
status=$?
if [ "$status" != 0 ]; then
    echo "Install ruby..."
    sudo apt install -y ruby
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
sudo apt install -y python-pip
pip --version
status=$?
if [ "$status" -eq 0 ]; then
    pip install neovim
fi

echo ""
echo "Python3:"
sudo apt install -y python3-pip
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
    sudo apt install -y ruby-dev
    sudo gem install neovim
fi

echo ""
echo "Perl:"
sudo apt install -y cpanminus
sudo apt install pmuninstall
cpanm -v
if [ "$status" -eq 0 ]; then
    cpanm --local-lib ~/perl5 Neovim::Ext
    echo 'eval $(perl -I $HOME/perl5/lib/perl5 -Mlocal::lib)' >>~/.bashrc
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
sudo apt install -y astyle
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install Ctags---------------------------------------------"
sudo apt install -y ctags
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install the other formatters------------------------------"
sudo apt install -y clang-format
sudo snap install shfmt
if [ "$?" != 0 ]; then
    git clone git@github.com:tmknom/shfmt.git
    cd shfmt
    make install
fi
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install xclip---------------------------------------------"
sudo apt install -y xclip
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
sudo apt autoremove -y
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

read -p "Set NeoVim as the default editor or replace vim?[Y/N]: " confirm

if [ "$confirm" = "y" ] || [ "$confrim" = "Y" ] || [ "$confirm" = "yes" ] || [ "$confirm" = "Yes" ]; then
    echo "export EDITOR=/snap/bin/nvim" >>~/.bashrc
    echo "alias vim='nvim'" >>~/.bashrc
    echo "alias vi='nvim'" >>~/.bashrc
fi

echo ""
echo "-------------------------------------------------------END"
echo 'Enjoy! ( ￣▽ ￣)～■ *Cheers* □ ～(￣▽ ￣)'

echo ""
echo "--------------------NVimmer-------------------------------"
green " _   ___     ___                               "
green "| \\ | \\ \\   / (_)_ __ ___  _ __ ___   ___ _ __ "
green "|  \\| |\\ \\ / /| | '_ \` _ \\| '_ \` _ \\ / _ \\ '__|"
green "| |\\  | \\ V / | | | | | | | | | | | |  __/ |   "
green "|_| \\_|  \\_/  |_|_| |_| |_|_| |_| |_|\\___|_|"

echo "--------------------Favour--------------------------------"
echo '(๑ •̀ ㅂ•́ )و ✧ Like NVimmer? Go to:'
echo ""
blue 'https://github.com/devilyouwei/NVimmer'
yellow '☆ ☆ ☆ ☆ ☆ '
echo ""
red 'Remeber to restart the terminal or reconnect to the server, then type nvim!'
echo ""
