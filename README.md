# NVimmer(EN)

New vimmer repo, will replace the old vimmer, config totally based on NeoVim

# NVimmer(CN)

NVimmer 是新版的 Vimmer，NVimmer 的配置将会完全基于 NeoVim 而不再是 Vim

目标仍然是配置一套简洁，快速，高效的 Vim IDE。

## 适用于

1. HTML CSS JS
2. Java
3. C#
4. vue
5. TypeScript
6. PHP
7. c/c++
8. Markdown
9. json

## 注意

很抱歉，老的 Vimmer 即将停止更新！

[https://github.com/devilyouwei/Vimmer](https://github.com/devilyouwei/Vimmer)

您可以使用 NVimmer 的 init.vim 配置 vim，但出于稳定性和兼容性，建议使用 NeoVim

## 让我们一起用 NeoVim 吧

巴西程序员 Thiago de Arruda Padilha（aka tarruda）向 Vim 开源编辑器项目递交了两大补丁，对 Vim 的架构进行了大幅调整，结果遭到了 Vim 作者 Bram Moolenaar 的拒绝，因为对于 Vim 这样一个成熟的项目进行如此大的改变风险太高。于是 tarruda 发起了 Vim fork 项目 Neovim，集资 1 万美元打造出 21 世纪的编辑器，提供更好的脚本、插件支持，整合现代的图形界面。

至今，NeoVim 的迅速崛起，大量的 vim 老用户，新用户迁移到了 Neovim 阵营。

作为 4 年多的 vim 忠实用户，在 ubuntu 上亲自尝试 NeoVim 之后，我决定使用 NeoVim 取代 Vim。

伴随之，之前的 Vimmer 项目也将停止更新，但仍然支持 bug 的修复，issue 的讨论。

未来所有的 Vim 新特性，新插件，新配置都会在 NVimmer 这个 repo 中进行。

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
// 克隆NVimmer
git clone https://github.com/devilyouwei/NVimmer.git

// 切换到项目下
cd NVimmer

// 在用户目录下新建nvim配置目录
mkdir ~/.config/nvim/

// 分别复制init.vim，.eslintrc和.prettier配置文件到nvim配置目录以及用户目录下，注意这样才能使配置文件生效
cp ./init.vim ~/.config/nvim/
cp ./.eslintrc.json ~/
cp ./.prettierrc.json ~/
```

**安装 NodeJS**

```
sudo apt install nodejs

//或者
curl -sL install-node.now.sh/lts | bash

```

如果嫌 ubuntu 源里的 node 版本太老，参考 node 官网安装最新版，本人的环境是 13

[https://nodejs.org](https://nodejs.org/)

**安装 Vim-Plug**

Vim-Plug 是一个强大的 vim 插件管理器

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
:CocInstall coc-phpls
:CocInstall coc-prettier
// 微信小程序
:CocInstall coc-wxml
// TS和JS
:CocInstall coc-tsserver
// vue
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
npm install vue-language-server -g
```

4. 针对 tagbar 安装 ctags

```
sudo apt install ctags
```

5. PHP 开发者

```
npm i intelephense -g
```

## 使用

**快捷键**

-   Emmet html 自动比和：ctrl+O auto create tags. Refer to 'Emmet'
-   保存: F5
-   保存并编译运行: F6
-   格式化代码：F12
-   清除空行: F2
-   打开当前目录文件树: F3
-   打开 Tagbar: F9 (需要 ctags)
-   自动补全：Coc 自动补全插件，按 Tab 键可以自动补全
-   buffer 切换：Ctrl+H，Ctrl+R，Ctrl+左键，Ctrl+右键
-   Tab 切换：同上，Ctrl 换成 Shift

## 问题

-   PlugInstall 安装好后打开 nvim，coc 的方法 call 不到，报错。请请检查你的 nvim 是不是低于 0.3.0，也可以输入:checkHealth 检查，清安装高于 0.3.0 的版本

-   C#的 CS 文件第一次进入会要求安装 monoserver 用于自动补全和代码检查，选择 Yes

-   Nerd 字体无法显示，nerdtree 里都是乱码和方块，该问题是因为你没有安装 nerd 字体，并把 Terminal 字体更换成 nerd 字体，建议将/font 目录下的 MonacoNerd.ttf 安装到系统中，并把 Gnome-terminal 字体改成 Monaco Nerd。苹果的 Monaco 字体真好看！

-   有些语言不能补全，检查是否安装上该语言的 LSP 服务器，上述有提到例如 php 的 intelephense

## 不想说再见 :sob:

如果您是一个 Vim 的死忠粉，不想要迁移到 NeoVim，仍想要那一套精简高效的 Vim 配置，可以继续使用我的 Vimmer 的配置：

[https://github.com/devilyouwei/Vimmer](https://github.com/devilyouwei/Vimmer)

## Examples

![example](example/ex1.png)

![example](example/ex2.png)

![example](example/ex3.png)

![example](example/ex4.png)

![example](example/ex5.png)

![example](example/ex6.png)
