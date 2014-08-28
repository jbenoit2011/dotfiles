""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Title: VIM CONFIGURATION
"
" Maintainer: Julien BENOIT
"
" Creation_date: 28.08.2014
" 
" Last_update: 28.08.2014
"
" Revision: 1- Initial file
"
" License: Do What The Fuck What You Want V2
"
" Inspired_by: http://amix.dk/vim/vimrc.html
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

colorscheme desert
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

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
