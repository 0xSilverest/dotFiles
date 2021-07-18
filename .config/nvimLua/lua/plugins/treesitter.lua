local M = {}

M.plugin = {
  "nvim-treesitter/nvim-treesitter",
  module = "nvim-treesitter",
  event = "BufRead",
  opt = true,
	run = ':TSUpdate',
  requires = {
    -- context aware commentstring
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require("plugins.treesitter").config()
  end,
}

M.config = function()
  local ts_config = require "nvim-treesitter.configs"

  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

  ts_config.setup {
    ensure_installed = {
      "haskell",
      "scala",
      "java",
      "clojure",
      "kotlin",
      "html",
      "css",
      "lua",
      "rust",
      "query",
      "python",
      "yaml",
      "json",
      "comment",
    },

    highlight = { 
      enable = true,
      disable = {"haskell"}
    },
    indent = { enable = false },
    playground = { enable = true },

    context_commentstring = {
      enable = true,
      config = {
        lua = "-- %s",
        haskell = "-- %s",
      },
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<Enter>",
        node_incremental = "<Enter>",
        node_decremental = "<BS>",
      },
    },

    autopairs = {enable = true},

    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<Leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<Leader>A"] = "@parameter.inner",
        },
      },
      lsp_interop = {
        enable = true,
      },
    },
  }
end

return M
