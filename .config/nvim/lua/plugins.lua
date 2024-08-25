return {
    -- Telescope and extensions
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'jvgrootveld/telescope-zoxide'
        },
        config = function()
            require('pluginsConfig.telescope')
        end
    },

    -- LSP and completion
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
            'folke/neodev.nvim',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'rafamadriz/friendly-snippets',
            'ray-x/lsp_signature.nvim',
        },
        config = function()
            require('pluginsConfig.lsp')
            require('pluginsConfig.cmp')
        end
    },
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
      config = function()
          require("pluginsConfig.metals")
      end
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            require("pluginsConfig.dap")
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'p00f/nvim-ts-rainbow',
        },
        build = ':TSUpdate',
        config = function()
            require('pluginsConfig.treesitter')
        end
    },

    -- Git integration
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('pluginsConfig.gitsigns')
        end
    },
    { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },

    -- Latex
    'lervag/vimtex',

    -- Themes
    {
        "alexmozaidze/palenight.nvim",
        lazy = false,
        config = function()
            local colors = require "palenight/colors/truecolor"
            colors.black = "#181616"
            colors.white = "#e5e5e5"
            colors.menu = "#1d1b1b"
        end,
    },

    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require'lualine'.setup {
                options = {
                    icons_enabled = true,
                    theme = 'palenight',
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
        end
    },

    -- File explorer
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('pluginsConfig.nvimtree')
        end
    },

    -- Session management
    {
        "olimorris/persisted.nvim",
        config = function()
            require("persisted").setup()
            require("telescope").load_extension("persisted")
        end,
    },

    -- UI enhancements
    { 'folke/which-key.nvim', opts = {} },
    'lukas-reineke/indent-blankline.nvim',
    {
        'ZhiyuanLck/smart-pairs',
        event = 'InsertEnter',
        config = function() require('pairs'):setup() end
    },
    'RRethy/vim-illuminate',
    {'machakann/vim-sandwich', keys = 's'},
    {
        'phaazon/hop.nvim',
        branch = 'v1',
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    },
    "nacro90/numb.nvim",
    { 'mrjones2014/smart-splits.nvim', build = './kitty/install-kittens.bash' },
    { 'nvim-focus/focus.nvim', version = '*' },
}
