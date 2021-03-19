" Coc config
source $HOME/.config/nvim/plug-config/coc.vim
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" theme config
set termguicolors
syntax enable
colorscheme onedark
let g:airline_theme='kolor'
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
