" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" do not keep a backup file, use versions instead
set nobackup
set nowritebackup
set history=100		" keep 100 lines of command line history	
set ruler			" show the cursor position all the time	
set showcmd			" display incomplete commands	
set incsearch		" do incremental searching

set tabstop=2
set shiftwidth=2
set expandtab

set number
set numberwidth=5

set ignorecase
set smartcase

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif