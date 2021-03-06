require('packer').startup(function(use)
-- Package manager
    use 'wbthomason/packer.nvim'

-- UI selector go brrrr
    use {'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim'}}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'jvgrootveld/telescope-zoxide'   

-- LSPs and stuff
    use 'nvim-treesitter/nvim-treesitter'

    use 'neovim/nvim-lspconfig'
    use 'ms-jpq/coq_nvim'
    use {'ms-jpq/coq.artifacts', branch = 'artifacts'}

    use 'ray-x/lsp_signature.nvim'

    use 'mfussenegger/nvim-dap'

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    }

    use {
        'scalameta/nvim-metals',
        requires = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap"
        },
    }

    use 'aklt/plantuml-syntax'
    use 'weirongxu/plantuml-previewer.vim'
    use 'tyru/open-browser.vim'

-- Cuz I can't code for myself
    use 'github/copilot.vim'

-- git shitshow
    use {'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }}
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

-- Latex
    use 'lervag/vimtex'

-- Theme
    use 'folke/tokyonight.nvim'

    use 'kyazdani42/nvim-web-devicons'

-- Status line
    use 'nvim-lualine/lualine.nvim'

-- File Management
    use {'kyazdani42/nvim-tree.lua',
            requires = {
              'kyazdani42/nvim-web-devicons', -- optional, for file icon
            },
            config = function() require'nvim-tree'.setup {} end
        }

-- Quality of life
    use 'lukas-reineke/indent-blankline.nvim'
    use 'p00f/nvim-ts-rainbow'
    use {'ZhiyuanLck/smart-pairs', event = 'InsertEnter', config = function() require('pairs'):setup() end}
    use 'RRethy/vim-illuminate'
    use {'machakann/vim-sandwich', keys = 's'}
    use {'phaazon/hop.nvim',
        branch = 'v1',
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end}
    use "Pocco81/AutoSave.nvim"
    use "nacro90/numb.nvim"
    use { 'michaelb/sniprun', run = 'bash ./install.sh'}

end)

require'nvim-web-devicons'.setup {
  default = true;
}

vim.g.tokyonight_style = "night"
vim.cmd[[colorscheme tokyonight]]


vim.g.tokyonight_lualine_bold = true

require'lualine'.setup {
	options = {
		icons_enabled = true,
		theme = 'tokyonight',
		disabled_filetypes = {}
	},
	sections = {
	   lualine_a = {'mode'},
	   lualine_b = {'branch'},
	   lualine_c = {'filename', 'lsp'},
	   lualine_x = {'encoding', 'fileformat', 'filetype'},
	   lualine_y = {'progress'},
	   lualine_z = {'location'}
	}
}

vim.g.coq_settings = {
    auto_start= true
}

vim.g.copilot_assume_mapped = true

require 'pluginsConfig.lsp'
require 'pluginsConfig.gitsigns'
require 'pluginsConfig.telescope'
require 'pluginsConfig.treesitter'
require 'pluginsConfig.dap'
require 'pluginsConfig.metals'
require 'pluginsConfig.nvimtree'
require 'pluginsConfig.autosave'

require "lsp_signature".setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})

require'hop'.setup()
require('numb').setup()
