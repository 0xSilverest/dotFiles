" Settings
let g:python3='usr/bin/python3'
let g:python2='usr/bin/python2'

set encoding=UTF-8
set nocompatible
set showmatch
set ignorecase
set hlsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set wildmode=longest,list
set clipboard+=unnamedplus
set inccommand=split
set foldenable 
set foldmethod=marker

filetype plugin indent on
syntax on

set number 
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set relativenumber
augroup END

