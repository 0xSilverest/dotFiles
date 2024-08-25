metals_config = require("metals").bare_config()

metals_config.settings = {
  showImplicitArguments = true,
  showInferredType = true,
  superMethodLensesEnabled = true,
  showImplicitConversionsAndClasses = true,
  enableSemanticHighlighting = true,
}

metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
metals_config.init_options.statusBarProvider = "on"
metals_config.init_options.treeViewProvider = true

metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()

  vim.keymap.set("n", "<leader>mc", require("metals").compile_cascade)
  vim.keymap.set("n", "<leader>mt", require("metals").type_of_range)
  vim.keymap.set("n", "<leader>mi", require("metals").toggle_setting)

  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
  vim.keymap.set("n", "K", vim.lsp.buf.hover)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
  vim.keymap.set("n", "gr", vim.lsp.buf.references)
end

local api = vim.api
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })

api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
