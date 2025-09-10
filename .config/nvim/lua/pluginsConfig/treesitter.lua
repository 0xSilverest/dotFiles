require('nvim-treesitter.configs').setup {
    ensure_installed = { "scala", "java", "haskell",
        "bash", "rust", "yaml", "json", "elixir",
        "latex", "fish", "bibtex", "dockerfile", "lua",
        "typescript", "svelte", "css", "html", "c", "scala",
        "clojure"
    },

    highlight = {
        enable = true, -- false will disable the whole extension
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        },
    },

    rainbow = {
      -- enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },

    indent = {
        enable = true,
    },

    matchup = {
        enable = true,
    },
}

vim.cmd([[
  augroup ClojureParenthesesClojureClojure
    autocmd!
    autocmd FileType clojure setlocal iskeyword+=?,-,*,!,+,/,=,<,>,.,:
  augroup END
]])
