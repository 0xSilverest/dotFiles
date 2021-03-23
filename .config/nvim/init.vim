" Plugins Download
call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neovim/node-client'
Plug 'drewtempelmeyer/palenight.vim'

" File Management
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Utils
Plug 'justinmk/vim-syntax-extra'
Plug 'terryma/vim-multiple-cursors'

" Python Plugins
Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }

" Haskell Plugins
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
Plug 'alx741/vim-hindent', {'for': 'haskell'}
Plug 'dense-analysis/ale', {'for': 'haskell'}

" Kotlin Plugins
Plug 'udalov/kotlin-vim', {'for': 'kotlin'}

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
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'sheerun/vim-polyglot'

" UML
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'

call plug#end()

" Coc config
source $HOME/.config/nvim/plug-config/coc.vim
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)


" theme config
set termguicolors
syntax enable
colorscheme palenight
let g:airline_theme='palenight'
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:python3='usr/bin/python3'
let g:python2='usr/lib/python2.7'

" haskell config
setlocal formatprg=hindent
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

filetype plugin indent on
syntax on

set number 
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set relativenumber
augroup END

autocmd InsertEnter,InsertLeave * set cul!
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

augroup myCmds
    au!
    autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Shortcuts
let g:mapleader = ','
map <Leader>tt :bel new term://fish<CR> 

" Travel between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits
noremap <silent> <C-Left> : vertical resize -3<CR>
noremap <silent> <C-Right> : vertical resize +3<CR>
noremap <silent> <C-Up> : resize +3<CR>
noremap <silent> <C-Down> : resize -3<CR>

" Swap between hs and vs
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

"nnoremap <leader> F :call CocAction('format')<CR>
