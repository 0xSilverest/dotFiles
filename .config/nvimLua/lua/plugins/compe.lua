local remap = vim.api.nvim_set_keymap

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
    border = "solid",
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  },

  source = {
    path = true;
    buffer = {
        enable=true,
        priority = 1};
    luasnip = true,
    nvim_lsp = {
        enable = true,
        priority = 10001,
    };
    tabnine = {
        enable = true,
        priority = 2,
    };
    latex_symbols = true;
    conjure = true;
    spell = true;
    tags = true;
  };
}

remap(
  "i",
  "<Tab>",
  'pumvisible() ? "<C-n>" : "<Tab>"',
  { silent = true, noremap = true, expr = true }
)

remap(
  "i",
  "<S-Tab>",
  'pumvisible() ? "<C-p>" : "<S-Tab>"',
  { silent = true, noremap = true, expr = true }
)

remap(
  "i",
  "<C-a>",
  "v:lua.Util.trigger_completion()",
  { silent = true, expr = true }
)

remap(
  "i",
  "<C-Space>",
  "compe#complete()",
  { noremap = true, expr = true, silent = true }
)
