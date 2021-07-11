-- LuaLine
local palenight = require'lualine.themes.palenight'
palenight.normal.c.bg = '#222635'
require('lualine').setup{
    options = { theme = palenight}
}

-- Treesitter
require'nvim-treesitter.ts_utils'

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {"haskell", "scala"},  -- will be reenabled once they get better support
  },
}

-- Lsp Signature
require "lsp_signature".on_attach()

-- Telescope
require 'telescope'.setup{}

-- Autopairs
require 'nvim-autopairs'.setup{}
require("nvim-autopairs.completion.compe").setup({
  map_cr = true,
  map_complete = true
})

-- Shade
local shade = require 'shade'

shade.setup{
  overlay_opacity = 50,
  opacity_step = 1,
  keys = {
    brightness_up    = '<C-Up>',
    brightness_down  = '<C-Down>',
    toggle           = '<Leader>ts',
  }
}

-- Symbols-outline
vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = 'right',
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    keymaps = {
        close = "<Esc>",
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
}

-- Which-key
require("which-key").setup {}

