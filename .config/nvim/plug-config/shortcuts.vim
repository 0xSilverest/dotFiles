" Shortcuts
let g:mapleader = ','
map <Leader>tt :bel new term://fish<CR> 
map <Leader>lh :OpenBrowser localhost<CR>

" Resize splits
nnoremap <silent> <M-H> : vertical resize -3<CR>
nnoremap <silent> <M-L> : vertical resize +3<CR>
nnoremap <silent> <M-K> : resize +3<CR>
nnoremap <silent> <M-J> : resize -3<CR>

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
inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Telescope
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" File Tree
map <C-s> :NvimTreeToggle<CR>
