require'compe'.setup {
  	enabled = true,
  	autocomplete = true,
  	debug = false,
  	min_length = 1,
  	preselect = 'enable',
  	throttle_time = 80,
  	source_timeout = 200,
  	incomplete_delay = 400,
  	max_abbr_width = 100,
  	max_kind_width = 100,
  	max_menu_width = 100,
  	documentation = true,

  	source = {
  	  	path = true,
        luasnip = {
            enable = true,
            priority = 10,
        },
  	  	buffer = {
            enable = true,
            priority = 1,
        },
  	  	nvim_lsp = {
            enable = true,
            priority = 9001, -- Over 9K :dab:
        },
        tabnine = {
            enable = true,
            priority = 8,
        },
  	  	latex_symbols = {
            enable = true,
            priority = 101, -- Latex dab over AI
            filetypes = {"latex", "tex"}
        },
  	  	spell = true,
  	  	tags = true,
  	},
}
