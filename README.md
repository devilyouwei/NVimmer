![logo](./example/logo.png)

_Continuously updating..._

# NVimmer(EN)

[Chinese Readme](README_ZH.md)

A simple, fast and efficient **VIM IDE Configuration**, it is especially suitable for full stack developers.

With Monaco nerd font on Linux.

NVimmer is a new version of [Vimmer](https://github.com/devilyouwei/Vimmer). The configuration of NVimmer will be based on NeoVim instead of Vim.

**Attention: NVimmer is going to replace Vimmer.**

## Support

1. HTML CSS JS
2. Java **[color enhanced]**
3. C# **[enhanced]**
4. vue
5. TypeScript
6. PHP
7. C/C++
8. Markdown
9. JSON
10. Wechat wxml
11. react js/jsx/tsx **[new]**
12. Kotlin **[weakly support]**
13. English Words 1K+ **[new]**
14. Emoji **[new]**

Python may be supported in the future.

Vue's language server has been fixed. Everthing works well in vue now!

## [Recommended] Ubuntu Shell Onekey Install

Execute the following commands, easy to install everything!

```
git clone https://github.com/devilyouwei/NVimmer.git
cd NVimmer
chmod +x ./ubuntu_install.sh && ./ubuntu_install.sh
```

## Quick Start (manually, step by step)

### Install NeoVim

Method 1: the NeoVim on Ubuntu apt is old, it is stable but never support the COC plugin.

So download the latest stable version through PPA.

```bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

Method 2 (**recommended**): you can use snap to install

```bash
sudo snap install --beta nvim --classic
```

For installation on other systems, please refer to the GitHub Tutorial:
[https://github.com/neovim/neovim/wiki/installing-neovim](https://github.com/neovim/neovim/wiki/installing-neovim)

### Clone NVimmer

For Linux

```bash
#Clone nvimmer
git clone https://github.com/devilyouwei/NVimmer.git

#Switch to project folder
cd NVimmer

#Copy nvim configuration directory to your home_user directory
mkdir ~/.config
cp -rf ./nvim/ ~/.config/
cp ./.eslintrc.json ~/
cp ./.prettierrc.json ~/
```

### Install NodeJS

I strongly **recommend** to use the tool [nvm](https://github.com/nvm-sh/nvm) to manage your nodejs!

**official node install script**

```bash
curl -sL install-node.now.sh/lts | bash
```

or

**use nvm**

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm install table
```

The node version in ubuntu apt is too old, please refer to the node official website to install the latest version. Mine is 13 and the node official website is [https://nodejs.org](https://nodejs.org/)

Attention: **DON'T USE SNAP** to install nodejs! NeoVim `:checkhealth` not passed!

### Install vim-plug

'vim-plug' is a powerful vim plugins manager!

For Linux

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Vim Plugin installation

Open nvim, then input command `:PlugInstall` to install all plugins

Or run in terminal

```bash
nvim -c PlugInstall
```

### Install coc plugins

The following plugins are COC plugins.

For auto complete, check errors/warnings, autoformat, color highlight and other ide functions, you can choose to install them according to your main language.

The following plugins will be installed automotically when you open NeoVim (because I config them in init.vim).

Of course, you can input the following commands to install them manually again in nvim or remove them from init.vim if you don't need it.

```bash
:CocInstall coc-html
:CocInstall coc-eslint
:CocInstall coc-snippets
:CocInstall coc-pairs
:CocInstall coc-emmet
:CocInstall coc-java
:CocInstall coc-json
:CocInstall coc-highlight
:CocInstall coc-css
:CocInstall coc-phpls
:CocInstall coc-stylelint
:CocInstall coc-omnisharp
:CocInstall coc-prettier
:CocInstall coc-wxml
:CocInstall coc-tsserver
:CocInstall coc-vetur
:CocInstall coc-angular
```

### Supplementary Installation

The following options can be customized for different developers, and fullstack can install all of them, which will never affect the performance.

**For node developers**

```bash
npm install -g neovim
```

**For Ruby developers**

```bash
sudo apt install ruby-dev
sudo gem install neovim
```

**For Perl**

```bash
sudo apt install cpanminus
sudo cpanm Neovim::Ext
```

**For Python**

```bash
pip install neovim #py2
pip3 install nepvim #py3
```

**For front-end and JS developers**

```bash
npm install -g eslint
```

1. '.eslintrc.json' and '.prettierrc.json' in home dir is the global eslint config, don't change it or add any plugin globally!

2. If you are using vue, html, react in your projects and want to lint such files. You should install the eslint plugins in **project** dir by using package.json or eslinrc.json.

Remember, put `eslint-plugin-*` only in your **project folder**, not **globally**!

**Install 'ctags' for tagbar and 'astyle' for AutoFormat**

```bash
sudo apt install ctags
sudo apt install astyle
sudo apt install clang-format
sudo snap install shfmt
```

**Install lazy git if needed (recommended)**

```bash
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit
```

## Issues

-   I want to use Monaco Nerd Fonts for my terminal. Please install the MonacoNerd.ttf in fonts

-   coc.nvim doesn't work. To ':checkhealth' in neovim and possibly your neovim is under 0.3.x, update your neovim

-   Float window doesn't work. Float window feature is added after neovim 0.4.x version. Please install the latest neovim!

## How To Use

**Quick keys**

-   **Ctrl-C, Ctrl-V, Ctrl-X** map to system clipboard, easy to copy and parse
-   Emmet HTML create tags automotically: **Ctrl-O**. Refer to 'Emmet'
-   Open Float Terminal: **F4**
-   Save: **F5**
-   Save and compile run: **F6**
-   Auto format code,document: **F12**
-   Clear blank lines: **F2**
-   Open current directory file tree: **F3**
-   Open tagbar: **F9** (ctags required)
-   Auto completion: COC auto completion, press **Tab** to auto complete
-   Buffer switch: **Ctrl+H**, **Ctrl+L**, **Ctrl+left**, **Ctrl+right**
-   Tab switch: as above, change Ctrl to **shift**
-   Find Definition of functions, classes, enter **'gd'**
-   Find tags, includeing functions, class globally, press: **Ctrl-T** or **ft**
-   Find buffers, press: **Ctrl-B** or **fb**
-   Find files in current path, press: **Ctrl-F** or **Ctrl-P** or **ff**
-   **[new]** Find English words in vim, should in 'Insert Mode' and press: **Ctrl-X** then **Ctrl-W**

## Examples :tada: :tada: :tada:

![example](example/example.png)

![example](example/ex1.png)

![example](example/ex2.png)

![example](example/ex3.png)

![example](example/ex4.png)

![example](example/ex5.png)

![example](example/ex6.png)

![example](example/ex7.png)

![example](example/ex8.png)

![example](example/ex9.png)

![example](example/ex10.png)

## My Global npm node modules

![example](example/npm.png)
