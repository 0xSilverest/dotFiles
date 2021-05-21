"Plug 'vim-scripts/dbext.vim' Plugint Download
call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
Plug 'neovim/node-client'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ap/vim-css-color'

" File Management
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Utils
Plug 'machakann/vim-sandwich'
Plug 'justinmk/vim-syntax-extra'
Plug 'terryma/vim-multiple-cursors'
Plug 'mcchrish/nnn.vim'

" Clojure Plugins
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'vim-scripts/VimClojure', {'for': 'clojure'}

" Haskell Plugins
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}

" Latex Plugins
Plug 'lervag/vimtex', {'for': 'latex'}

" Autocompletion/Intellisense
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'jiangmiao/auto-pairs'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}

" Linting
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'

" UML
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'

" Db
Plug 'vim-scripts/dbext.vim'
call plug#end()

" Coc config
"let g:omni_sql_no_default_maps = 1
source $HOME/.config/nvim/plug-config/coc.vim

" Scala Metals
source $HOME/.config/nvim/plug-config/metals.vim
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" theme config
set termguicolors
syntax enable
let g:palenight_color_overrides = {
\    'black': { 'gui': '#1e2127', "cterm": "0", "cterm16": "0" },
\}
colorscheme palenight
let g:airline_theme='palenight'

let g:python3='usr/bin/python3'
let g:python2='usr/lib/python2.7'

" haskell config
let g:haskellmode_completion_ghc = 1
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_enable_detailed_browse = 1 
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" fzf with ctrl-p
nnoremap <C-p> :FZF<CR>

" NerdTree Config 
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-s> :NERDTreeToggle<CR>

" Latex Config
let g:tex_flavor = "latex" 
let g:vimtex_compiler_progname = 'nvr'
let g:syntastic_tex_checkers = ['lacheck']

" NNN config
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

" Settings
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

filetype plugin indent on
syntax on

set number 
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set relativenumber
augroup END

" Shortcuts
let g:mapleader = ','
map <Leader>tt :bel new term://fish<CR> 
map <Leader>lh :OpenBrowser localhost<CR>

" Travel between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Resize splits
noremap <silent> <C-Left> : vertical resize -3<CR>
noremap <silent> <C-Right> : vertical resize +3<CR>
noremap <silent> <C-Up> : resize +3<CR>
noremap <silent> <C-Down> : resize -3<CR>

" Swap between hs and vs
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

"nnoremap <leader> F :call CocAction('format')<CR>
