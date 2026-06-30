-- nvim-treesitter `main` branch API.
-- Parsers are installed explicitly; features are enabled per-buffer.
local parsers = {
    "scala", "java", "bash", "yaml", "json",
    "fish", "lua", "css", "html", "c", "clojure",
    "zig", "javascript", "python"
}

-- Install/keep parsers up to date (async; no-op if already installed).
require('nvim-treesitter').install(parsers)

-- Enable highlighting + indentation for any buffer with an installed parser.
vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        local lang = vim.treesitter.language.get_lang(ft) or ft
        if pcall(vim.treesitter.start, buf, lang) then
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})

vim.cmd([[
  augroup ClojureParenthesesClojureClojure
    autocmd!
    autocmd FileType clojure setlocal iskeyword+=?,-,*,!,+,/,=,<,>,.,:
  augroup END
]])
