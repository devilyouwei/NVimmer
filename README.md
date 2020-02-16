# NVimmer(CN)

New vimmer repo, will replace the old vimmer, config totally based on NeoVim

# NVimmer(ZH)

NVimmer 是新版的 Vimmer，正如 NeoVim 之于 Vim，NVimmer 的配置将会完全基于 NeoVim，目标仍然是配置一套简洁，快速，高效的 Mini IDE。

## 注意

很抱歉，老的 Vimmer 即将停止更新！[https://github.com/devilyouwei/Vimmer](https://github.com/devilyouwei/Vimmer)

配置文件目前仍然支持 Vim 编辑器，您可以使用该配置替代~/.vimrc，但出于稳定性和兼容性，建议使用 NeoVim

## 让我们一起用 NeoVim 吧

巴西程序员 Thiago de Arruda Padilha（aka tarruda）向 Vim 开源编辑器项目递交了两大补丁，对 Vim 的架构进行了大幅调整，结果遭到了 Vim 作者 Bram Moolenaar 的拒绝，因为对于 Vim 这样一个成熟的项目进行如此大的改变风险太高。于是 tarruda 发起了 Vim fork 项目 Neovim，集资 1 万美元打造出 21 世纪的编辑器，提供更好的脚本、插件支持，整合现代的图形界面。

至今，NeoVim 的迅速崛起，大量的 vim 老用户，新用户迁移到了 Neovim 阵营。

作为 4 年多的 vim 忠实用户，在 ubuntu 上亲自尝试 NeoVim 之后，本人毅然决定将我的默认编辑器从 vim 迁移到 neovim 编辑器。

伴随之，之前的 vimmer 项目也将停止更新支持，但维持 Vimmer 已有插件，配置的维护和更新，也仍然支持 bug 的修复，issue 的问答。未来所有的新特性，新插件，新配置只会在 NVimmer 这个 repo 中进行。

NVimmer 将会代替 Vimmer 成为我新的，活跃的 vim 配置。

_README 使用 Vim8 写于 2020 年 2 月 15 日，纪念弃 vim，入坑 NeoVim。_

## 开始

**安装 Neovim**

法 1：ubuntu，ubuntu 自带的 neovim 比较老，但比较稳定，不支持 coc 插件，所以用 ppa 方式下载最新稳定版。

```bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

法 2：也可以用 snap 安装，按照官方说法，snap 可以安装 candidate 版本，但是 ubuntu 里的 snap 找不到，只能安装 edge 和 beta 版本，建议安装 beta

```bash
sudo snap install --beta nvim --classic
```

其他系统安装请参考 github 官方教程：[https://github.com/neovim/neovim/wiki/Installing-Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

**克隆 NVimmer**

切换到克隆的 NVimmer 目录中，复制配置文件到用户目录下

```bash

git clone https://github.com/devilyouwei/NVimmer.git

cd NVimmer

mkdir ~/.config/nvim/

cp ./init.vim ~/.config/nvim/
cp ./.eslintrc.json ~/
cp ./.prettierrc.json ~/
```

**安装 NodeJS**

```
sudo apt install nodejs
```

如果嫌 ubuntu 源版本太老，参考 node 官网安装最新版，本人的环境是 13

**安装 Vim-Plug**

Linux

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

**插件安装**

进入 nvim，输入:PlugInstall 安装所有插件

**Coc 插件安装**

以下插件是 Coc 安装插件，为了自动补全，自动纠错，格式化，色彩高亮等 IDE 功能准备的，可以根据自己语言需求选择安装。

打开 nvim，输入以下命令

```
:CocInstall coc-html
:CocInstall coc-eslint
:CocInstall coc-snippets
:CocInstall coc-pairs
:CocInstall coc-emmet
:CocInstall coc-java
:CocInstall coc-json
:CocInstall coc-highlight
:CocInstall coc-css
:CocInstall coc-prettier
// 微信小程序
:CocInstall coc-wxml
// TS和JS
:CocInstall coc-tsserver
:CocInstall coc-vetur
:CocInstall coc-angular
```

**补充安装**

1. 针对 node 开发者

```bash
npm install -g neovim
```

2. 针对 Ruby 开发者

```bash
gem install neovim
```

3. 针对前端和 JS 开发者

```bash
npm install -g eslint
npm install -g prettier
npm install -g eslint-plugin-prettier
npm install -g eslint-config-prettier
```

4. 针对 tagbar 安装 ctags

```
sudo apt install ctags
```

## 问题

-   PlugInstall 安装好后打开 nvim，coc 的方法 call 不到请检查你的 nvim 是不是低于 0.3.0，也可以输入:checkHealth 检查，清安装高于 0.3.0 的版本

-   C#的 CS 文件第一次进入会要求安装 monoserver 用于自动补全和代码检查，选择 Yes

-   Nerd 字体无法显示，nerdtree 里都是乱码和方块，该问题是因为你没有安装 nerd 字体，并把 Gnome-terminal 字体更换成 nerd 字体，建议将/font 目录下的 MonacoNerd.ttf 安装到系统中，Monaco 字体真好看，并把 Gnome-terminal 字体改成 Monaco Nerd

## 不想说再见 :sob:

如果您是一个 Vim 的死忠粉，不想要迁移到 NeoVim，仍想要那一套精简高效的 Vim 配置，可以继续使用我的 Vimmer 的配置：

[https://github.com/devilyouwei/Vimmer](https://github.com/devilyouwei/Vimmer)
