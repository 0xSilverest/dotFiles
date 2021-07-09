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

map q: <Nop>
nnoremap Q <nop>

" LuaSnip 
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" Compe 
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
