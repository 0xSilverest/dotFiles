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
        "clangd", "bashls", "yamlls", "dockerls", "html", "clojure_lsp",
        "diagnosticls", "hls", "jsonls", "zls", "texlab", "tsserver",
        "cssls", "gradle_ls", "svelte"
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
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

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
    dockerls = {},
    jsonls = {},
    clojure_lsp = {},
    diagnosticls = {},
    hls = {
        filetypes = { 'haskell', 'lhaskell', 'cabal' },
    },
    zls = {},
    texlab = {},
    tsserver = {},
    svelte = {},
    html = {},
    cssls = {},
    gradle_ls = {},
    metals = {}
}

mason_lspconfig.setup_handlers({
    function(server_name)
        local opts = {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = servers[server_name].settings,
            filetypes = servers[server_name].filetypes,
            cmd = servers[server_name].cmd,
            root_dir = servers[server_name].root_dir,
        }

        if servers[server_name] then
            opts = vim.tbl_deep_extend("force", opts, servers[server_name])
        end

        lspconfig[server_name].setup(opts)
    end,
})
