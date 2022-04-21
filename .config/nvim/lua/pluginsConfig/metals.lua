metals_config = require("metals").bare_config()

metals_config.settings = {
  showImplicitArguments = true,
}

metals_config.init_options.statusBarProvider = "on"

local dap = require("dap")

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
      --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}

metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()
end

vim.cmd [[augroup lsp]]
vim.cmd [[au!]]
vim.cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach({metals_config})]]
vim.cmd [[augroup end]]

--local api = vim.api
--local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
--api.nvim_create_autocmd("FileType", {
--  pattern = { "scala", "sbt" },
--  callback = function()
--    require("metals").initialize_or_attach(metals_config)
--  end,
--  group = nvim_metals_group,
--})
