"vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch':'release'}
let g:coc_global_extensions=[
            \'coc-omnisharp',
            \'coc-html',
            \'coc-eslint',
            \'coc-snippets',
            \'coc-pairs',
            \'coc-emmet',
            \'coc-java',
            \'coc-json',
            \'coc-highlight',
            \'coc-css',
            \'coc-phpls',
            \'coc-prettier',
            \'coc-wxml',
            \'coc-tsserver',
            \'coc-vetur',
            \'coc-stylelint',
            \'coc-angular',
            \'coc-word',
            \'coc-tabnine',
            \'coc-emoji'
            \]
"Plug 'Shougo/neco-vim'
"Plug 'neoclide/coc-neco'
Plug 'voldikss/vim-floaterm'
let g:floaterm_type = 'floating'
let g:floaterm_winblend = '25'
let g:floaterm_position = 'center'
hi FloatermNF guibg=black
hi FloatermBorderNF guibg=orange guifg=cyan
Plug 'tomasr/molokai'
Plug 'majutsushi/tagbar', {'on':'TagbarToggle'}
Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'udalov/kotlin-vim', {'for':'kotlin'}
Plug 'uiiaoo/java-syntax.vim', {'for':'java'}
Plug 'othree/html5.vim', {'for':['html','vue','php','javascript']}
Plug 'mattn/emmet-vim', {'for':['html','xml','vue','php','javascript','typescript','typescript.tsx','javascript.jsx']}
Plug 'alvan/vim-closetag', {'for':['html','xml','vue','php','javascript','typescript','typescript.tsx','javascript.jsx']}
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript',{'for':'javascript'}
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'isRuslan/vim-es6'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
let g:vim_jsx_pretty_colorful_config = 1 " default 0
Plug 'vim-scripts/matchit.zip'
Plug 'leshill/vim-json', {'for':'json'}
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'chemzqm/wxapp.vim', {'for':['wxml','wxss','js']}
Plug 'OmniSharp/omnisharp-vim', {'for':'cs'}
"Plug 'OrangeT/vim-csharp', {'for':'cs'}
Plug 'w0rp/ale', {'for':'cs'}
Plug 'posva/vim-vue', {'for':'vue'}
Plug 'hail2u/vim-css3-syntax'
let g:vue_pre_processors = []
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = [
            \'css',
            \'cs',
            \'markdown',
            \'vue',
            \'html',
            \'javascript',
            \'typescript',
            \'kotlin',
            \'reactjavascript',
            \'reacttypescript',
            \'php'
            \]
"彩虹括号
Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
            \ ['brown', 'RoyalBlue3'],
            \ ['Darkblue', 'SeaGreen3'],
            \ ['darkgray', 'DarkOrchid3'],
            \ ['darkgreen', 'firebrick3'],
            \ ['darkcyan', 'RoyalBlue3'],
            \ ['darkred', 'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown', 'firebrick3'],
            \ ['gray', 'RoyalBlue3'],
            \ ['black', 'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue', 'firebrick3'],
            \ ['darkgreen', 'RoyalBlue3'],
            \ ['darkcyan', 'SeaGreen3'],
            \ ['darkred', 'DarkOrchid3'],
            \ ['red', 'firebrick3'],
            \ ]
let g:rbpt_max = 8
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons
call plug#end()
"------------------------------coc.nvim---------------------------------------
filetype on
autocmd CursorHold * silent call CocActionAsync('highlight')
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"------------------------------coc.nvim---------------------------------------------
"
"
"-----------------------------omnisharp----------------------------------------------
filetype indent plugin on
" Use the stdio OmniSharp-roslyn server
let g:OmniSharp_server_stdio = 1
" Set the type lookup function to use the preview window instead of echoing it
"let g:OmniSharp_typeLookupInPreview = 1
" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5
" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
" Fetch full documentation during omnicomplete requests.
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
let g:omnicomplete_fetch_full_documentation = 1
set previewheight=5
" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }
augroup omnisharp_commands
    autocmd!
    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup
    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END
" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>
" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>
"-----------------------------omnisharp--------------------------------------------------

"vim基础设置-----------------------------------------------------------------------------
if has("gui_running")
    au GUIEnter * simalt ~x " 窗口启动时自动最大化
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    "set showtabline=0 " 隐藏Tab栏
endif
syntax enable
set sw=4
set ts=4
set et
set smarttab
set smartindent
set lbr
set fo+=mB
set sm
set selection=inclusive
set wildmenu
set mousemodel=popup
set termguicolors
set re=1
set lazyredraw
set synmaxcol=0
set t_Co=256
"--------------------------------------------显示相关---------------------------------------
set cul "高亮光标所在行
set cuc
color molokai     " 设置背景主题
set ruler           " 显示标尺
set showcmd         " 输入的命令显示出来，看的清楚些
set scrolloff=2     " 光标移动到buffer的顶部和底部时保持3行距离
set laststatus=2   " 启动显示状态行(1),总是显示状态行(2)
set foldenable      " 允许折叠
set foldmethod=manual   " 手动折叠
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 使用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
set showmode
" 历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set cmdheight=1
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=$,@,%,#,-,_
set guifont=Monaco\ Bold\ 12
filetype plugin on
"tab, buffer快捷键配置----------------------------------------------------------------------------
map <S-H> :tabp<CR>
map <S-L> :tabn<CR>
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
map <C-H> :bn<CR>            "下一个缓冲区
map <C-L> :bp<CR>        "上一个缓冲区
map <C-Left> :bn<CR>            "下一个缓冲区
map <C-Right> :bp<CR>        "上一个缓冲区
"代码格式化---------------------------------------------------------------------------------------
noremap <F12> :syntax sync fromstart<CR>:Format<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"前端主要使用Prettier美化
autocmd filetype markdown,css,yaml,typescript nnoremap <buffer> <F12> :Prettier<CR>
"编译型
autocmd filetype cs,c,cpp,kotlin,sh noremap <buffer> <F12> :Autoformat<CR>
"常用快捷键---------------------------------------------------------------------------------------
"去空行，去行尾空格
nnoremap <F2> :g/^\s*$/d<CR>:g/\s\+$/s<CR>
"html标签自动补全
map! <C-O> <C-Y>,
"列出当前目录文件
nmap <F3> :NERDTreeToggle<CR>
nmap <F4> :FloatermToggle<CR>
"tagbar
nmap <F9> :TagbarToggle<CR>
"按F5保存
nmap <F5> :syntax sync fromstart<CR>:w<CR>
"按F6编译运行
nmap <F6> :syntax sync fromstart<CR>:call Compile()<CR>
func! Compile()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'kotlin'
        exec "!kotlinc-native % -o %<"
        exec "!time ./%<.kexe"
    elseif &filetype == 'cs'
        exec "!mcs %"
        exec "!time mono %<.exe"
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'javascript'
        exec "!time node %"
    elseif &filetype == 'php'
        exec "!time php %"
    elseif &filetype == 'sh'
        exec "!./%"
    endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc
"实用配置------------------------------------------------------------------------------
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 设置当文件被改动时自动载入
set autoread
au FocusGained * :checktime
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全
set completeopt=longest,menu
"自动保存
set autowrite
" 去掉输入错误的提示声音
"set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
"禁止自动分行
set wrap
set linebreak
"禁止生成临时文件
set noundofile
set nobackup
set nowritebackup
set noswapfile
"搜索忽略大小写
set ignorecase
set smartcase
set linespace=0
"set spell spelllang=en_us
" 使回格键（backspace）正常处理indent, eol, start等
set listchars=tab:»■,trail:■
set list
set backspace=2
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=5
set autochdir "输出时只有文件名，不带./ ../等目录前缀(默认了执行％在当前的目录下)
set termencoding=UTF-8
set encoding=UTF-8
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030
"在插入模式中使用Ctrl+v粘贴全局剪贴板内容
imap <C-V> <Esc>"+gp
nmap <C-V> "+gp
"在Visual模式中使用Ctrl+c复制内容到全局剪贴板
vnoremap <C-c> "+y
"在Visual模式中使用Ctrl+x剪切内容到全局剪贴板
vnoremap <C-x> "+x
"##### 在fcitx输入法下，一旦进入vim normal模式会恢复到英文###########
let g:input_toggle = 1
function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction
set ttimeoutlen=150
"退出插入模式
"autocmd InsertLeave,CmdLineLeave * call Fcitx2en()
"#####################################################################
"
"
"
"fzf-----------------------------------------------------------------------
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-w> <plug>(fzf-complete-word)
imap <c-x><c-p> <plug>(fzf-complete-path)
imap <c-x><c-f> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
nmap <C-F> :Files<CR>
nmap <C-P> :Files<CR>
nmap ff :Files<CR>
imap <C-P> <Esc>:Files<CR>
nmap <C-B> :Buffers<CR>
nmap fb :Buffers<CR>
imap <C-B> <Esc>:Buffers<CR>
nmap <C-T> :Tags<CR>
nmap ft :Tags<CR>
let g:fzf_action = { 'ctrl-b': 'edit' }

" Advanced customization using Vim function
inoremap <expr> <c-x><c-w> fzf#vim#complete#word({'right': '20%'})

"闪烁光标------------------------------------------------------------------
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175

