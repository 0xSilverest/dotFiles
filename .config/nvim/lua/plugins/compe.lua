require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  map_cr = true;
  map_complete = true;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    enable = true,
    border = "solid",
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  },

  source = {
    path = true,
    buffer = true,
    luasnip = true,
    nvim_lsp = true,
    tabnine = true,
    latex_symbols = true,
    conjure = true,
    spell = true,
    tags = true,
  };
}
