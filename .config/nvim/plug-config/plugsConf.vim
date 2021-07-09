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

