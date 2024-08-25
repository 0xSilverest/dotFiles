local trouble = require("trouble.providers.telescope")

require('telescope').setup {
  defaults = {
    mappings = {
        i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
        },
    },
  },
}

require('telescope').load_extension 'fzf'
require('telescope').load_extension 'zoxide'
require('telescope').load_extension 'metals'
