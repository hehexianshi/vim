if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible 
filetype off
set rtp+=/Users/xielily/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on
syntax on

set tags=tags;

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

function! InsertTabWrapper()
    let col=col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-N>"
    endif
endfunction

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let b:javascript_fold=1
let javascript_enable_domhtmlcss=1
let NERDTreeShowHidden=1
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>
let &guicursor = &guicursor . ",a:blinkon0"
set nu
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set noeb
set autoindent
set cindent
set ignorecase
set hlsearch
set incsearch
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set laststatus=2
set statusline=%F%m%r,%Y,%{&fileformat}\ \ ASCII=\%b,HEX=\%B\ \ %l,%c%V\ %p%%\ \ [%L\ lines\ in\ all]
set iskeyword+=_,$,@,%,#,-
set wildmenu
set keywordprg = "help"
set whichwrap+=<,>,h,l
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key
set report=0
set shortmess=atI
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set matchtime=5
set cursorline
set cursorcolumn
set cmdheight=2
set runtimepath +=/tmp/doc
set fdm=indent
highlight Cursorcolumn guibg=green ctermbg=darkgray ctermfg=white  
set autochdir
au BufRead,BufNewFile *.lbi set ft=html
color atom-dark
set guioptions-=T
set langmenu=zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim 
set imcmdline
au FileType php setlocal dict+=/usr/local/nginx/html/php_funclist.txt
au BufRead,BufNewFile *.go set filetype=go
"set dictionary+=/opt/go/go/api/go1.txt
au FileType go setlocal dict+=/opt/go/go/api/go1.txt
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
au BufNewFile,BufReadPost *.js setl shiftwidth=2 expandtab
"autocmd BufNewFile /usr/local/nginx/html/sale/*.php exec ":call SetTitle()"
call pathogen#infect()
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'full'
:set scrolloff=21 

nnoremap <cw> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
nnoremap <F5> "=strftime("%c")<CR>gP
nnoremap q :q<CR>
inoremap <F5> <C-R>=strftime("%c")<CR>
nnoremap <C-Z> :set nonu<CR>
nnoremap <C-X> :set nu<CR>
nnoremap cc d$
nnoremap cp :vsplit<CR>
nnoremap tt :Tabularize /=<CR>
nnoremap ty :Tabularize /=><CR>

map <F2> :NERDTreeToggle<CR>
map <F3> :!go153 run %<CR>
nmap <F4> <Esc>:tabnext<CR>
imap <F8> <Esc>:w<CR>
map <F9> :!/opt/www/go/bin/go run %<CR>
map <C-J> :!/usr/local/php/bin/php -l %<CR>
imap <C-A> <C-x><C-o>
nmap mm :%s/\r//g<cr>

if exists("g:did_load_filetypes")
    filetype off 
    filetype plugin indent off 
endif
set runtimepath+=/opt/go/go/misc/vim
Bundle 'Blackrush/vim-gocode'
filetype plugin indent on
syntax on
autocmd FileType go153 autocmd BufWritePre <buffer> Fmt
autocmd BufWritePost,FileWritePost *.php :!/usr/bin/php -l %
filetype plugin on
