local sumneko_root_path = "/home/silverest/Git/lua-language-server/"
local sumneko_binary = '/home/silverest/Git/lua-language-server/bin/Linux/lua-language-server'
local lib = {}
local M = {}

local add = function(l)
  for _, p in pairs(vim.fn.expand(l, false, true)) do
    p = vim.loop.fs_realpath(p)
    lib[p] = true
  end
end

add "$VIMRUNTIME"
add "~/.config/nvim"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

M.config = {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "main.lua"},
  on_attach = Util.lsp_on_attach,
  on_init = Util.lsp_on_init,
  on_new_config = function(config, root)
    local libs = vim.tbl_deep_extend("force", {}, lib)
    libs[root] = nil
    config.settings.Lua.workspace.lib = libs
    return config
  end,
  settings = {
    Lua = {
      completion = {
        enable = true,
        callSnippet = "Replace",
      },
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = (function()
          local path = vim.split(package.path, ";")
          table.insert(path, "lua/?.lua")
          table.insert(path, "lua/?/init.lua")
          return path
        end)(),
      },
      diagnostics = {
        enable = true,
        globals = {
          "vim",
          "describe",
          "it",
          "before_each",
          "after_each",
          "awesome",
          "theme",
          "client",
          "P",
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        lib = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },  
}

return M
