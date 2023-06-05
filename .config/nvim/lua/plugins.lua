require('packer').startup(function(use)
-- Package manager
    use 'wbthomason/packer.nvim'

-- UI selector go brrrr
    use {'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim'}}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'jvgrootveld/telescope-zoxide'   
    --
-- LSPs and stuff
    use 'nvim-treesitter/nvim-treesitter'

    use 'neovim/nvim-lspconfig'
    use {'ms-jpq/coq_nvim', branch = 'coq'}
    use {'ms-jpq/coq.thirdparty', branch = '3p'}
    use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
    use 'github/copilot.vim'

    use 'ray-x/lsp_signature.nvim'

    use 'mfussenegger/nvim-dap'

    use 'VidocqH/lsp-lens.nvim'

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

    use {
      'mrcjkb/haskell-tools.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim', -- optional
      },
      branch = '1.10.2', -- recommended
    }

    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    }

-- git shitshow
    use {'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }}
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

-- Latex
    use 'lervag/vimtex'

-- Theme
    use 'folke/tokyonight.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }

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
    use({"olimorris/persisted.nvim",
        config = function()
            require("persisted").setup()
            require("telescope").load_extension("persisted")
        end,})
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
    use "nacro90/numb.nvim"
end)

require'nvim-web-devicons'.setup {
  default = true;
}

--vim.g.tokyonight_style = "night"
--vim.cmd[[colorscheme tokyonight-night]]


-- vim.g.tokyonight_lualine_bold = true

require'lualine'.setup {
	options = {
		icons_enabled = true,
		theme = 'catppuccin',
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

require "lsp_signature".setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require'lsp-lens'.setup({})
require'hop'.setup()
require('numb').setup()

require("catppuccin").setup({
    integrations = {
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        ts_rainbow = true,
    }
})

vim.cmd.colorscheme "catppuccin-mocha"
