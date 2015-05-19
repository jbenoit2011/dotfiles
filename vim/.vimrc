""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Title: VIM CONFIGURATION
"
" Maintainer: Julien BENOIT
"
" Creation_date: 2014-08-28
" 
" Last_update: 2015-05-16
"
" Revision: 2 - Add plugins, and many others settings
"
" License: Do What The Fuck What You Want V2
"
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=700

" set trailing line number
set number

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Recognize .md as Markdown files
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Highlight current line
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax on

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Enable Powerline bindings
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

" Enable Pathogen
execute pathogen#infect()

" Always show statusline
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4 " when in insert mode <tab> is pressed move 4 columns

" Linebreak on 500 characters
set lbr
set tw=80

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

filetype on " enable filetype detection
filetype plugin on " enable filetype plugins
filetype indent on " enable filetype indentation

" backup rules
set backup " enable backup files (.txt~)
set undofile " enable persistent undo

silent execute '!mkdir -p $HOME/.vim/tmp/backup'
set backupdir=$HOME/.vim/tmp/backup " where to store backup
silent execute '!mkdir -p $HOME/.vim/tmp/swap'
set directory=$HOME/.vim/tmp/swap " where to store swap
silent execute '!mkdir -p $HOME/.vim/tmp/views'
set viewdir=$HOME/.vim/tmp/views " where to store view
silent execute '!mkdir -p $HOME/.vim/tmp/undo'
set undodir=$HOME/.vim/tmp/undo " where to store undo 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Open NERDTree automatically on startup
autocmd vimenter * NERDTree

" Get into main window, not in NERDTree
autocmd VimEnter * wincmd p

" Close automatically NERDTREE if it the only one tab remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Toggle NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

" Bash is my shell
" Well, not really. But this makes CLI integration better.
let bash_is_sh=1

" Repair weird terminal/vim settings
set backspace=start,eol,indent

" Use viminfo
set viminfo='100,f1,\"1000,:100,/100,h,%

" .inc, phpt, phtml, phps files as PHP
autocmd BufNewFile,BufRead *.inc set ft=php
autocmd BufNewFile,BufRead *.phpt set ft=php
autocmd BufNewFile,BufRead *.phtml set ft=php
autocmd BufNewFile,BufRead *.phps set ft=php

" Turn off modelines
set modelines=0

" JSHint (CTRL-L when in a JS file)
autocmd FileType javascript noremap <C-L> :!jshint %<CR>

" PHP syntax settings
let php_sql_query=1
let php_htmlInStrings=1
"let php_folding=1
let php_parent_error_close=1
let php_parent_error_open=1

" PHP parser check (CTRL-L)
autocmd FileType php noremap <C-L> :w!<CR>:!php -l %<CR>

" run file with PHP CLI (CTRL-M)
autocmd FileType php noremap <C-M> :w!<CR>:!php %<CR>
" run file using PHPUnit (Leader-u)
autocmd FileType php noremap <Leader>u :w!<CR>:!phpunit %<CR>

" Trim trailing whitespace and \r characters
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml,phtml,vimrc autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Allows all operations to work with system clipboard
set clipboard=unnamed

" Add xdebug2 dictionary when in PHP files
autocmd FileType php set dictionary+=~/.vim/dic/xdebug2

" TagBar toggle shortcut
nmap <F8> :TagbarToggle<CR>

" PhpDocumentor For Vim shortcut
noremap <buffer> <C-p> :call pdv#DocumentCurrentLine()<CR>

" Call pman when pressing SHIFT + K
set keywordprg=pman

" Default Colors for CursorLine
highlight CursorLine guifg=Black guibg=DarkBlue ctermfg=Black ctermbg=DarkBlue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'joonty/vdebug'
Plugin 'majutsushi/tagbar'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'vim-scripts/highlight_cursor.vim'
Plugin 'eiginn/netrw'
Plugin 'kien/ctrlp.vim'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'vim-scripts/php_getset.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'powerman/vim-plugin-viewdoc'
Plugin 'airblade/vim-gitgutter'
Plugin 'mkusher/padawan.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'MattesGroeger/vim-bookmarks'

call vundle#end()            " required
filetype plugin indent on    " required

" Apply colorscheme
colorscheme solarized
