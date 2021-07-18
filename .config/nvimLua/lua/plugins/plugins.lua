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
    { "wbthomason/packer.nvim", opt = true },

    require("plugins.telescope").plugin,
    require("plugins.treesitter").plugin,
    require("plugins.jdtls").plugin,
    require("plugins.metals").plugin,

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
    {"hrsh7th/nvim-compe",
        event = "InsertEnter",
        wants = "LuaSnip",
        config = function()
          require "plugins.compe"
        end,
        requires = {
          {
            "L3MON4D3/LuaSnip",
            opt = true,
            config = function()
              require "plugins.luasnip"
            end,
          },
        },
    },
    {'tzachar/compe-tabnine', run = './install.sh'},
    {'tami5/compe-conjure'},
    'L3MON4D3/LuaSnip',
    'kosayoda/nvim-lightbulb',

-- Linting
    'dense-analysis/ale',
    'ray-x/lsp_signature.nvim',

-- Async brrr
    'tpope/vim-dispatch',
    {'Olical/conjure' , ft={'clj'}},

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
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end},

-- Haskell
    {'neovimhaskell/haskell-vim' , ft = {'hs'}},
    {'mpickering/hlint-refactor-vim', ft = {'hs'}},

-- Waiting for Treesitter Support for haskell and Scala
    'sheerun/vim-polyglot',

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
    {'GoldsteinE/compe-latex-symbols'},
    {'jghauser/auto-pandoc.nvim', ft = {'markdown', 'latex'}},
    {'dhruvasagar/vim-table-mode', ft = {'text', 'markdown'}},

-- Theme
    'christianchiarulli/nvcode-color-schemes.vim',{
  'hoob3rt/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
},-- File Management
    {'kyazdani42/nvim-web-devicons',
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,},

    {'kyazdani42/nvim-tree.lua', 
      config = function()
        require "plugins.nvim-tree"
      end,},

-- Helper tools
    'simrat39/symbols-outline.nvim',
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
        end},
    {'AndrewRadev/splitjoin.vim', keys = 'gS' },
    {"andymass/vim-matchup",
    after = "nvim-treesitter",
    setup = function()
      vim.g.matchup_matchparen_offscreen = {
        method = "popup",
        fullwidth = true,
        highlight = "Normal",
      }
    end,},

-- Utils 
    {'machakann/vim-sandwich', keys = 's' },
    'romainl/vim-cool',
    'pbrisbin/vim-mkdir',
    'lukas-reineke/indent-blankline.nvim',
    'sunjon/shade.nvim',
    'ap/vim-css-color',
}

return packer.startup(function(use)
  for _, v in pairs(plugins) do
    use(v)
  end
end)
