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
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup {
            auto_open = false,
            auto_close = true,
            use_diagnostic_signs = true
        }
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
        branch = 'main',
        lazy = false,
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
        },
        build = ':TSUpdate',
        config = function()
            require('pluginsConfig.treesitter')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require('treesitter-context').setup({
                max_lines = 3,            -- cap the sticky context height
                multiline_threshold = 1,  -- collapse multiline nodes to one line
            })
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

    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require'lualine'.setup {
                options = {
                    icons_enabled = true,
                    theme = require('twilightserpent.lualine'),
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
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
      'stevearc/oil.nvim',
      opts = {},
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Session management
    {
        "olimorris/persisted.nvim",
        config = function()
            require("persisted").setup()
            require("telescope").load_extension("persisted")
        end,
    },

    {
        'HiPhish/rainbow-delimiters.nvim',
        submodules = false,
        config = function()
            require('rainbow-delimiters.setup').setup {}
        end
    },

    {
        'smoka7/hop.nvim',
        version = '*',
        config = function()
            require('hop').setup {}
        end
    },

    -- UI enhancements
    'lukas-reineke/indent-blankline.nvim',
    {'machakann/vim-sandwich', keys = 's'},
    {
      "nacro90/numb.nvim",
      config = function()
        require('numb').setup({
          show_numbers = true,
          show_cursorline = true,
          hide_relativenumbers = true,
          number_only = false,
        })
      end
    },
    { 'mrjones2014/smart-splits.nvim', build = './kitty/install-kittens.bash' },
    { 'nvim-focus/focus.nvim', version = '*' },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    -- Keymap discovery
    {
        'folke/which-key.nvim',
        event = "VeryLazy",
        opts = {}
    },

    -- Highlight other uses of the word under the cursor
    {
        'RRethy/vim-illuminate',
        event = "VeryLazy",
        config = function()
            require('illuminate').configure({
                providers = { 'lsp', 'treesitter', 'regex' },
                delay = 120,
            })
        end
    },

    -- Formatting
    {
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
        config = function()
            require('conform').setup({
                formatters_by_ft = {
                    lua = { 'stylua' },
                    javascript = { 'prettier' },
                    json = { 'prettier' },
                    css = { 'prettier' },
                    html = { 'prettier' },
                    -- zig, scala, etc. fall back to their LSP formatter below
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_format = 'fallback', -- use LSP (ZLS, jdtls, metals) when no formatter listed
                },
            })
        end
    },

    -- Quick file navigation
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local harpoon = require('harpoon')
            harpoon:setup()
            vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end,
                { desc = 'Harpoon: add file' })
            vim.keymap.set('n', '<leader>e', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
                { desc = 'Harpoon: toggle menu' })
            for i = 1, 4 do
                vim.keymap.set('n', '<leader>' .. i, function() harpoon:list():select(i) end,
                    { desc = 'Harpoon: file ' .. i })
            end
        end
    }
}
