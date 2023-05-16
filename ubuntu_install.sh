#!/bin/bash

function yellow() {
    echo -e "\033[33m\033[01m\033[05m$1\033[0m"
}

function red() {
    echo -e "\033[31m\033[01m$1\033[0m"
}

function green() {
    echo -e "\033[32m$1\033[0m"
}

function byellow() {
    echo -e "\033[33m\033[01m$1\033[0m"
}

function blue() {
    echo -e "\033[34m$1\033[0m"
}

echo ''
echo '================================================================'
green " _   ___     ___                               "
green "| \\ | \\ \\   / (_)_ __ ___  _ __ ___   ___ _ __ "
green "|  \\| |\\ \\ / /| | '_ \` _ \\| '_ \` _ \\ / _ \\ '__|"
green "| |\\  | \\ V / | | | | | | | | | | | |  __/ |   "
green "|_| \\_|  \\_/  |_|_| |_| |_|_| |_| |_|\\___|_|"
echo '================================================================'
green "Welcome to NVimmer, Make your NeoVim/Vim perform like an IDE!!!"
blue 'Contributors:'
blue 'devilyouwei'
blue 'https://github.com/devilyouwei/NVimmer'
echo ''
red "Specific tips for users in China Mainlaind:"
byellow '1. 有些插件需要科学上网...'
byellow '2. 更换gem, npm, pip等包管理器的镜像为国内源'
byellow '(When in China, change the npm, gem, pip source to China Mainland)'
echo ''
red 'We strongly suggest your system is fresh and clear.'
red 'If you have vim or neovim configs, you need to make the backup. Press <Ctrl-C> to stop.'
red '我们建议您的系统是干净的，如果已经有vim或者neovim的配置，应该提前备份，否则会被覆盖，按<Ctrl-C>结束该脚本'
red "Waiting for installing, 5 seconds..."
echo ''

sleep 5

echo "Install Linux Compiling Tools and Basic Env------------------------"
sudo --version
status=$?
if [ "$status" != 0 ]; then
    echo "Install sudo"
    apt install -y sudo
fi
sudo apt update
sudo apt install -y cmake build-essential automake git ssl-cert clang-tools
echo "-----------------------------------------------------------"
echo ""
sleep 1

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
    sudo snap install nvim --classic
    if [ "$?" != 0 ]; then
        sudo apt install -y software-properties-common
        sudo add-apt-repository ppa:neovim-ppa/unstable -y
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
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    if [ "$?" != 0 ]; then
        red "Network Error: curl fail to download 'nvm'"
        exit 1
    fi
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    nvm install stable
fi
echo "-----------------------------------------------------------"
echo ""
sleep 1

echo "Check Python3----------------------------------------------"
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
if [ "$?" -eq 0 ]; then
    npm -g install neovim
fi
sleep 1

# never support python2 and pip2

echo ""
echo "Python3:"
pip3 --version
if [ "$?" != 0 ]; then
    sudo apt install -y python3-pip
fi
# sudo apt install python3-neovim
pip3 install neovim
pip3 install neovim-remote
sleep 1

echo ""
echo "Ruby:"
gem -v
if [ "$?" -eq 0 ]; then
    sudo apt install -y ruby-dev
    sudo gem install neovim
fi
sleep 1

echo ""
echo "Perl:"
sudo apt install -y cpanminus pmuninstall
cpanm -v
if [ "$?" -eq 0 ]; then
    cpanm --local-lib ~/perl5 Neovim::Ext
    cpanm Neovim::Ext
fi
cat ~/.bashrc | grep perl5
if [ "$?" != 0 ]; then
    echo 'eval $(perl -I $HOME/perl5/lib/perl5 -Mlocal::lib)' >>~/.bashrc
fi
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install Yarn, ESLint, Prettier-------------------------------"
eslint -v
if [ "$?" != 0 ]; then
    echo "Install eslint..."
    npm -g install eslint
fi
prettier -v
if [ "$?" != 0 ]; then
    echo "Install prettier..."
    npm -g install prettier
fi
yarn -v
if [ "$?" != 0 ]; then
    echo "Install yarn..."
    npm -g install yarn
fi
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install astyle--------------------------------------------"
sudo apt install -y astyle
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install universal ctags---------------------------------------------"
sudo apt install universal-ctags
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install the other formatters------------------------------"
sudo apt install -y clang-format
sudo snap install shfmt
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Install xclip---------------------------------------------"
sudo apt install -y xclip
echo "----------------------------------------------------------"
echo ""
sleep 1

green "Config Your NeoVim---------------------------------------"
curl -o ~/.config/nvim/init.vim --create-dirs \
    https://raw.githubusercontent.com/devilyouwei/NVimmer/main/nvim/init.vim
if [ "$?" != 0 ]; then
    red "Network Error: curl fail to download 'init.vim'"
    exit 1
fi

curl -o ~/.config/nvim/coc-settings.json --create-dirs \
    https://raw.githubusercontent.com/devilyouwei/NVimmer/main/nvim/coc-settings.json
if [ "$?" != 0 ]; then
    red "Network Error: curl fail to download 'coc-settings.json'"
    exit 1
fi

green "Config successfully!"
green "----------------------------------------------------------"
echo ""
sleep 1

echo "Install vim-plug------------------------------------------"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ "$?" != 0 ]; then
    red "Network Error: curl fail to download 'plug.vim'"
    exit 1
fi
echo "----------------------------------------------------------"
echo ""
sleep 1

echo "Clean trash and packages----------------------------------"
sudo apt autoremove -y
if [ ! -d ".git" ]; then
    rm ubuntu_install.sh
fi
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

read -p "Set NeoVim as the default editor and replace vim? [Y/N]: " confirm

if [ "$confirm" = "y" ] || [ "$confrim" = "Y" ] || [ "$confirm" = "yes" ] || [ "$confirm" = "Yes" ]; then
    # BASH
    echo "export EDITOR=/snap/bin/nvim" >>~/.bashrc
    echo "alias vim='nvim'" >>~/.bashrc
    echo "alias vi='nvim'" >>~/.bashrc

    # ZSH
    echo "export EDITOR=/snap/bin/nvim" >>~/.zshrc
    echo "alias vim='nvim'" >>~/.zshrc
    echo "alias vi='nvim'" >>~/.zshrc
fi

echo ""
echo '================================================================'
green 'Enjoy! ( ￣▽ ￣)～■ *Cheers* □ ～(￣▽ ￣)'
green '安装完毕！Finish!'

echo ""
echo '================================================================'
green " _   ___     ___                               "
green "| \\ | \\ \\   / (_)_ __ ___  _ __ ___   ___ _ __ "
green "|  \\| |\\ \\ / /| | '_ \` _ \\| '_ \` _ \\ / _ \\ '__|"
green "| |\\  | \\ V / | | | | | | | | | | | |  __/ |   "
green "|_| \\_|  \\_/  |_|_| |_| |_|_| |_| |_|\\___|_|"
echo '================================================================'
echo ""

yellow '☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ '
echo '(๑ •̀ ㅂ•́ )و ✧ Like NVimmer? Go to:'
blue 'https://github.com/devilyouwei/NVimmer'
blue 'devilyouwei@gmail.com'
yellow '☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ '

echo ''
byellow 'Remeber to restart the terminal or reconnect to the server, then type nvim!'
byellow '安装完毕，请先重启终端，然后输入vi即可'
