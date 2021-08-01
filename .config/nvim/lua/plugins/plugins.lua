fn = vim.fn

vim.cmd [[packadd packer.nvim]]

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
    return
end

packer.init {
    compile_path = fn.stdpath('data').."/site/pack/loader/start/packer.nvim/plugin/packer_compiled.lua",
    git = {
        clone_timeout = 300,
    },
    display = {
        open_fn = function()
            return require("packer.util").float { border = Util.borders }
        end,
    },
}

local plugins = {
    {"wbthomason/packer.nvim",
        opt = true},

    require("plugins.telescope").plugin,
    --Tree sitter fucks compe for some reason
    --require("plugins.treesitter").plugin,
    require("plugins.jdtls").plugin,
    require("plugins.rust-tools").plugin,

    {"nvim-lua/plenary.nvim",
        module = "plenary"},

    {"nvim-lua/popup.nvim",
        module = "popup"},

-- Autocompletion/Intellisense
    {"neovim/nvim-lspconfig",
        config = function()
            require "modules.lsp"
        end,
    },
    'Raimondi/delimitMate',
    'ray-x/lsp_signature.nvim',
    {"hrsh7th/nvim-compe",
        requires = {
            {"L3MON4D3/LuaSnip",
                opt = true,
                config = function()
                    require "plugins.luasnip"
                end},
            'GoldsteinE/compe-latex-symbols',
            {'tzachar/compe-tabnine',
                run = './install.sh'},
        },
        config = function()
            require'plugins.compe'
        end
    },
-- A   sync brrr
       'tpope/vim-dispatch',
    {'Olical/conjure', tag = 'v4.22.0', ft='clojure'},
    {'clojure-vim/vim-jack-in', ft='clojure'},

-- Some Debug Thing
    {"mfussenegger/nvim-dap",
        keys = "<Leader>d",
        config = function()
            require "modules.dap"
        end,
    },
    {"folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end},

-- Scala
    {'scalameta/nvim-metals',
        ft = 'scala',
        config = function()
            require "plugins.metals"
        end},

-- Haskell
    {'mpickering/hlint-refactor-vim',
        ft = {'haskell'}},

-- Nix
    {"LnL7/vim-nix",
        ft= {'nix'}},

-- Latex Plugins
    {'lervag/vimtex', ft = 'latex',
        setup = function()
            vim.g.vimtex_quickfix_enabled = false
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_compiler_latexmk = {
                options = {
                    "--shell-escape",
                    "-verbose",
                    "-file-line-error",
                    "-synctex=1",
                    "-interaction=nonstopmode",
                },
            }
        end,
    },
    {'jghauser/auto-pandoc.nvim',
        ft = {'markdown', 'latex'}},
    {'dhruvasagar/vim-table-mode',
        ft = {'text', 'markdown'}},

-- Theme
    'folke/tokyonight.nvim',
    'christianchiarulli/nvcode-color-schemes.vim',

-- File Management
   {'kyazdani42/nvim-web-devicons',
        module = "nvim-web-devicons",
    },
    {'kyazdani42/nvim-tree.lua',
        config = function()
            require "plugins.nvim-tree"
        end,
    },

-- Status line
   {'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
    },

-- Highlighing inc
   'sheerun/vim-polyglot',
    {"andymass/vim-matchup",
        setup = function()
            vim.g.matchup_matchparen_offscreen = {
                method = "popup",
                fullwidth = true,
                highlight = "Normal",
            }
        end,
    },

-- Helper tools
    'kosayoda/nvim-lightbulb',
    {"phaazon/hop.nvim",
        cmd = "HopWord",
        setup = function()
            vim.api.nvim_set_keymap(
                "n",
                "<Leader>w",
                "<CMD>HopWord<CR>",
                { noremap = true }
            )
        end,
        config = function()
            require("hop").setup {}
        end
    },

-- Utils
    {'machakann/vim-sandwich', keys = 's'},
    'romainl/vim-cool',
    {'jghauser/mkdir.nvim',
      config = function()
         require('mkdir')
      end},
    'lukas-reineke/indent-blankline.nvim',
    {'sunjon/shade.nvim',
        config = function()
            require'shade'.setup{
                overlay_opacity=50,
                opacity_step=2,
                keys = {
                    brightness_up = '<C-up>',
                    brightness_down = '<C-down>'
                }
            }
        end},
   'ap/vim-css-color',
}

return packer.startup(function(use)
    for _, v in pairs(plugins) do
        use(v)
    end
end)
