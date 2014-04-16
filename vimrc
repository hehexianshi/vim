if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup fedora
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

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

"PHP Auto Completion
"
set dictionary+=./*
set dictionary+=/home/chopin/Code/php_function_list
set complete+=k
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
let NERDTreeShowHidden=0
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
"set scrolloff=3
"set smartindent
"set foldenable
"set foldmethod=marker
"set foldmethod=expr
"set foldlevel =1
set cursorline
set cursorcolumn
set cmdheight=2
set runtimepath +=/tmp/doc
set fdm=indent
highlight Cursorcolumn guibg=green ctermbg=darkgray ctermfg=white  
set autochdir
au BufRead,BufNewFile *.lbi set ft=html
"colorscheme mycolor
color evening
"set guioptions-=m
set guioptions-=T
"set guifont=文泉驿等宽正黑\ Bold\ 12
nnoremap <cw> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
set langmenu=zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim 
set imcmdline
au FileType php setlocal dict+=/usr/local/nginx/html/php_funclist.txt
au BufRead,BufNewFile *.go set filetype=go
autocmd BufNewFile /usr/local/nginx/html/weibo.eswine.com/*.php,/usr/local/nginx/html/weibo.eswine.com/*.js,/usr/local/nginx/html/weibo.eswine.com/*.html exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'php' || &filetype == 'javascript'
        call setline(1, "<?php")
        call append(line("."), "\/**")
        call append(line(".")+1, " * @file : ".expand("%"))
        call append(line(".")+2, " *")
        call append(line(".")+3, " * @brief")
        call append(line(".")+4, " *")
        call append(line(".")+5, " * Copyright(C) 2010-2015 http://easescent.com, Inc. or its affiliates. All Rights Reserved.")
        call append(line(".")+6, " *")
        call append(line(".")+7, " * @version $Id$")
        call append(line(".")+8, " *")
        call append(line(".")+9, " * @author lidong zhubaiying@gmail.com")
        call append(line(".")+10, " * @date ".strftime("%c"))
        call append(line(".")+11, " */")
    elseif &filetype == 'html'
        call setline(1, "<!--")
        call append(line("."), " * @file : ".expand("%"))
        call append(line(".")+1, " *")
        call append(line(".")+2, " * @brief")
        call append(line(".")+3, " *")
        call append(line(".")+4, " * Copyright(C) 2010-2015 http://easescent.com, Inc. or its affiliates. All Rights Reserved.")
        call append(line(".")+5, " *")
        call append(line(".")+6, " * @version $Id$")
        call append(line(".")+7, " *")
        call append(line(".")+8, " * @author lidong zhubaiying@gmail.com")
        call append(line(".")+9, " * @date ".strftime("%c"))
        call append(line(".")+10, " -->")
    endif
    autocmd BufNewFile * normal G
endfunc
call pathogen#infect()
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'full'
"autocmd vimenter * NERDTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeShowBookmarks=1
:set scrolloff=21 
:nnoremap <F5> "=strftime("%c")<CR>gP
:inoremap <F5> <C-R>=strftime("%c")<CR>
:nnoremap <C-Z> :set nonu<CR>
:nnoremap <C-X> :set nu<CR>
:nnoremap cc d$<CR>
