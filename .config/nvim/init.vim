"Plugin Download
call plug#begin('~/.local/share/nvim/plugged')

" Autocompletion/Intellisense
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
Plug 'L3MON4D3/LuaSnip'

" Linting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'dense-analysis/ale'
Plug 'ray-x/lsp_signature.nvim'

" Async brrr
Plug 'tpope/vim-dispatch'

" Some Debug Thing
Plug 'mfussenegger/nvim-dap'
Plug 'folke/trouble.nvim'

" Find Things brrrrrrrrrr
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
            
" Scala
Plug 'scalameta/nvim-metals'

" Haskell 
Plug 'neovimhaskell/haskell-vim' , {'for': 'haskell'}
Plug 'mpickering/hlint-refactor-vim', {'for': 'haskell'}

" Java 
Plug 'mfussenegger/nvim-jdtls'

"Waiting for Treesitter Support for haskell and Scala
Plug 'sheerun/vim-polyglot' 

" Latex Plugins
Plug 'lervag/vimtex', {'for': 'latex'}
Plug 'jghauser/auto-pandoc.nvim'

" Theme
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'hoob3rt/lualine.nvim'

" File Management
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Utils
Plug 'simrat39/symbols-outline.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/which-key.nvim'
Plug 'sunjon/shade.nvim'
Plug 'ap/vim-css-color'
Plug 'romainl/vim-cool'
Plug 'pbrisbin/vim-mkdir'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'tyru/open-browser.vim'

call plug#end()

" Lua config
source $HOME/.config/nvim/plug-config/lsp-config.lua
source $HOME/.config/nvim/plug-config/init.lua
source $HOME/.config/nvim/plug-config/compe-config.lua
source $HOME/.config/nvim/plug-config/sumneko_lua.lua

" Vim config
source $HOME/.config/nvim/plug-config/defaultSettings.vim
source $HOME/.config/nvim/plug-config/themeConf.vim
source $HOME/.config/nvim/plug-config/plugsConf.vim
source $HOME/.config/nvim/plug-config/shortcuts.vim
