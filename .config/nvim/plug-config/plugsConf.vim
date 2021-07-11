" Nvim tree
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' , '.target']
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_update_cwd = 1

" Latex Config
let g:tex_flavor = "latex" 
let g:vimtex_compiler_progname = 'nvr'
let g:syntastic_tex_checkers = ['lacheck']

" LSUpdate
let g:lspupdate_commands = {'pip': 'pip install -U %s'}
