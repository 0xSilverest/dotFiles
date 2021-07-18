require("modules.keymap")
require("modules.options")
require("modules.util")
require("plugins.plugins")

local palenight = require'lualine.themes.palenight'
palenight.normal.c.bg = '#222635'
require('lualine').setup{
    options = { theme = palenight}
}
require "lsp_signature".setup()
