require 'modules.keymap'
require 'modules.options'
require 'modules.util'
require 'plugins.plugins'

require 'nvim-web-devicons' .setup {default = true;}
require 'plugins.lualine'
require "lsp_signature".setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "single"
  }
})
