vim.cmd [[augroup lsp]]
vim.cmd [[au!]]
vim.cmd [[au FileType java,scala,sbt lua require("metals").initialize_or_attach({})]]
vim.cmd [[augroup end]]

metals_config = require("metals").bare_config()
metals_config.init_options.statusBarProvider = "on"

metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()
end

