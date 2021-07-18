local M = {}

M.plugin = {
    "scalameta/nvim-metals",
    wants = "telescope.nvim",
    settings = {
        showImplicitArguments = true,
    },
    setup = function()
        vim.cmd [[
            augroup lsp
              au!
              au FileType scala,sbt lua require("nvim-metals").initialize_or_attach()
            augroup end
        ]]
    end,
}

M.setup = function()
    metals_config = require'metals'.bare_config

    metals_config.init_options.statusBarProvider = "on"

    metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = {},
        fallbackScalaVerison = "3.0.0",
        scalafixConfigPath = "project/.scalafix.conf",
        scalafmtConfigPath = "project/.scalafmt.conf",
    }

    capabilities.textDocument.completion.completionItem.snippetSupport = true
    metals_config.capabilities = capabilities

    metals_config.on_attach = function()
        require'completion'.on_attach();
        require'metals'.setup_dap()
    end

    metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {
                prefix = '',
            }
        }
    )
end

return M
