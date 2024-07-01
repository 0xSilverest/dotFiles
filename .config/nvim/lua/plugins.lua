require("lazy").setup({
-- Package manager
     'wbthomason/packer.nvim',

    -- UI selector go brrrr
     {'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim'}},
     {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
     'jvgrootveld/telescope-zoxide',
    --
-- LSPs and stuff
    {
      'neovim/nvim-lspconfig',
      dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

        'folke/neodev.nvim',
      },
    },

    {
      -- Autocompletion
      'hrsh7th/nvim-cmp',
      dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',

        -- Adds a number of user-friendly snippets
        'rafamadriz/friendly-snippets',
      },
    },

    { 'folke/which-key.nvim', opts = {} },

    {
      -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
      build = ':TSUpdate',
    },

    'ray-x/lsp_signature.nvim',

    --'mfussenegger/nvim-dap',

    --'VidocqH/lsp-lens.nvim',

    {
       "folke/trouble.nvim",
       dependencies = "kyazdani42/nvim-web-devicons",
       config = function()
           require("trouble").setup {}
       end
    },
    {
        'scalameta/nvim-metals',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap"
        },
    },
    {
        'mrcjkb/haskell-tools.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        version = "^2",
        ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate"
    },
    --{
    --    "Exafunction/codeium.nvim",
    --    dependencies = {
    --        "nvim-lua/plenary.nvim",
    --        "hrsh7th/nvim-cmp",
    --    },
    --    config = function()
    --        require("codeium").setup({
    --        })
    --    end
    --},

-- git shitshow
    {'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' }},
    { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },

-- Latex
    'lervag/vimtex',

-- Theme
    'folke/tokyonight.nvim',
    { "catppuccin/nvim", as = "catppuccin" },

    'kyazdani42/nvim-web-devicons',

-- Status line
    'nvim-lualine/lualine.nvim',

-- File Management
    {'kyazdani42/nvim-tree.lua',
        dependencies = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = function() require'nvim-tree'.setup {} end
    },

-- Quality of life
    ({"olimorris/persisted.nvim",
        config = function()
            require("persisted").setup()
            require("telescope").load_extension("persisted")
        end,}),
    'lukas-reineke/indent-blankline.nvim',
    'p00f/nvim-ts-rainbow',
    {'ZhiyuanLck/smart-pairs', event = 'InsertEnter', config = function() require('pairs'):setup() end},
    'RRethy/vim-illuminate',
    {'machakann/vim-sandwich', keys = 's'},
    {'phaazon/hop.nvim',
        branch = 'v1',
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end},
    "nacro90/numb.nvim",
    { 'mrjones2014/smart-splits.nvim', build = './kitty/install-kittens.bash' },
    { 'nvim-focus/focus.nvim', version = '*' },
}, {})

require("catppuccin").setup({
    transparent_background = true,
    integrations = {
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        ts_rainbow = true,
    }
})

vim.cmd.colorscheme "catppuccin-mocha"

require'nvim-web-devicons'.setup {
  default = true;
}

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


require 'pluginsConfig.lsp'
require 'pluginsConfig.gitsigns'
require 'pluginsConfig.telescope'
require 'pluginsConfig.treesitter'
--require 'pluginsConfig.dap'
require 'pluginsConfig.metals'
require 'pluginsConfig.nvimtree'
require 'pluginsConfig.cmp'

require "lsp_signature".setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})

--require'lsp-lens'.setup({})
require'hop'.setup()
require('numb').setup()
