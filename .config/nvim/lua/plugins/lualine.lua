vim.g.tokyonight_lualine_bold = true;
require'lualine'.setup {
	options = {
		icons_enabled = true,
		theme = 'tokyonight',
		disabled_filetypes = {}
	},
	sections = {
	   lualine_a = {'mode'},
	   lualine_b = {'branch'},
	   lualine_c = {'filename', 'lsp'},
	   lualine_x = {'encoding', 'fileformat', 'filetype'},
	   lualine_y = {'progress'},
	   lualine_z = {'location'}
	}
}



