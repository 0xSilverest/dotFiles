"Plugin Download
call plug#begin('~/.local/share/nvim/plugged')

" Autocompletion/Intellisense
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
Plug 'L3MON4D3/LuaSnip'

" Linting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'mfussenegger/nvim-dap'

" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
Plug 'drewtempelmeyer/palenight.vim'

" File Management
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}

" Utils
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mcchrish/nnn.vim'
Plug 'ap/vim-css-color'
Plug 'windwp/nvim-autopairs'

" Haskell 
Plug 'mpickering/hlint-refactor-vim'

" Latex Plugins
Plug 'lervag/vimtex', {'for': 'latex'}

" UML
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'

call plug#end()

" Lua config
source $HOME/.config/nvim/plug-config/luaConf.lua
source $HOME/.config/nvim/plug-config/compe-config.lua
source $HOME/.config/nvim/plug-config/sumneko_lua.lua

" Vim config
source $HOME/.config/nvim/plug-config/defaultSettings.vim
source $HOME/.config/nvim/plug-config/themeConf.vim
source $HOME/.config/nvim/plug-config/lsp-config.vim
source $HOME/.config/nvim/plug-config/shortcuts.vim
source $HOME/.config/nvim/plug-config/plugsConf.vim


