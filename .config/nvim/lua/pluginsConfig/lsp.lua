local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

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
        "texlab", "gradle_ls", "zls", "jdtls", "eslint"
    },
    automatic_installation = true,
})

-- Keymaps are better set once via LspAttach autocmd rather than per-server
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set('n', 'gD',         vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd',         vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K',          vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi',         vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>',      vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D',  vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gr',         vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
        vim.keymap.set('n', '<leader>f',  function()
            vim.lsp.buf.format({ async = true })
        end, opts)

        if client and client.name == "clangd" then
            local root_dir = client.config.root_dir or vim.fn.getcwd()
            vim.api.nvim_set_current_dir(root_dir)
        end
    end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('clangd', {
    capabilities = capabilities,
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
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_markers = { 'compile_commands.json', 'compile_flags.txt', '.git' },
    init_options = {
        compilationDatabasePath = "build",
    },
})

vim.lsp.config('zls', {
    capabilities = capabilities,
    settings = {
        zls = {
            enable_inlay_hints = true,
            enable_snippets = true,
            warn_style = true,
        },
    },
})

vim.lsp.config('jdtls', {
    capabilities = capabilities,
    root_markers = { 'pom.xml', 'build.gradle', '.git' },
    init_options = {
        bundles = {}
    },
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
    },
})

-- Servers with no extra config beyond capabilities
for _, server in ipairs({ 'bashls', 'yamlls', 'jsonls', 'texlab', 'ts_ls', 'gradle_ls', 'eslint' }) do
    vim.lsp.config(server, { capabilities = capabilities })
end

vim.lsp.enable({
    'clangd', 'bashls', 'yamlls', 'jsonls',
    'texlab', 'ts_ls', 'gradle_ls', 'zls', 'jdtls',
    'eslint',
})
