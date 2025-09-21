require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "scala", "java", "bash", "yaml", "json", "elixir",
        "latex", "fish", "bibtex", "dockerfile", "lua",
        "css", "html", "c", "clojure", "zig"
    },

    highlight = {
        enable = true,
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
