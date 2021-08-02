require('nvim-treesitter.configs').setup {
    ensure_installed = { "scala", "java",
        "bash", "rust", "yaml", "json", "solidity", "clojure",
        "latex", "fish", "bibtex", "dockerfile", "lua" },
    
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
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },

    indent = {
        enable = true,
    },
}
