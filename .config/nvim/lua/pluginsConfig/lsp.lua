local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

mason_lspconfig.setup({
    ensure_installed = {
        "clangd", "bashls", "yamlls", "jsonls", "dockerls",
        "texlab", "gradle_ls", "zls", "jdtls"
    },
    automatic_installation = true,
})

local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)

    if client.name == "clangd" then
        local root_dir = client.config.root_dir or vim.fn.getcwd()
        vim.api.nvim_set_current_dir(root_dir)
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {
    clangd = {
        cmd = {
            "clangd",
            "--background-index",
            "--suggest-missing-includes",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--query-driver=/usr/bin/gcc",
            "--compile-commands-dir=.",
            "-j=12",
        },
        filetypes = {"c", "cpp", "objc", "objcpp"},
        root_dir = function(fname)
            return lspconfig.util.root_pattern(
                'compile_commands.json',
                'compile_flags.txt',
                '.git'
            )(fname) or vim.fn.getcwd()
        end,
        init_options = {
            compilationDatabasePath = "build",
        },
    },
    bashls = {},
    yamlls = {},
    jsonls = {},
    texlab = {},
    ts_ls = {},
    gradle_ls = {},
    zls = {
        settings = {
            zls = {
                enable_inlay_hints = true,
                enable_snippets = true,
                warn_style = true,
            },
        },
    },
    jdtls = {
        settings = {
            java = {
                configuration = {
                    runtimes = {
                        {
                            name = "JavaSE-17",
                            path = vim.fn.expand("~/.sdkman/candidates/java/17.0.10-tem/"),
                            default = true
                        },
                        {
                            name = "JavaSE-21",
                            path = vim.fn.expand("~/.sdkman/candidates/java/21.0.5-tem/"),
                        }
                    }
                },
                compile = {
                    nullAnalysis = { mode = "automatic" },
                },
                completion = {
                    favoriteStaticMembers = {
                        "org.junit.jupiter.api.Assertions.*",
                        "org.mockito.Mockito.*"
                    },
                    filteredTypes = {
                        "com.sun.*",
                        "io.micrometer.shaded.*"
                    }
                },
                sources = {
                    organizeImports = {
                        starThreshold = 9999,
                        staticStarThreshold = 9999
                    }
                },
                format = { enabled = true },
                saveActions = {
                    organizeImports = true
                }
            }
        }
    },
}

lspconfig.jdtls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = servers.jdtls.settings,
    root_dir = function(fname)
        return lspconfig.util.root_pattern('pom.xml', 'build.gradle', '.git')(fname) or vim.fn.getcwd()
    end,
    init_options = {
        bundles = {}
    }
})

for server_name, server_config in pairs(servers) do
    if server_name ~= "jdtls" then
        local opts = {
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = server_config.filetypes,
            settings = server_config.settings,
            cmd = server_config.cmd,
            root_dir = server_config.root_dir,
            init_options = server_config.init_options,
        }

        for k, v in pairs(opts) do
            if v == nil then
                opts[k] = nil
            end
        end

        lspconfig[server_name].setup(opts)
    end
end
