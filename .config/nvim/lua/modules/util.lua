local fn, api = vim.fn, vim.api

_G.Util = {}

P = function(stuff)
  print(vim.inspect(stuff))
  return stuff
end

Util.t = function(cmd)
  return api.nvim_replace_termcodes(cmd, true, true, true)
end

Util.convert_colour = function(mode)
  local result

  if mode == "rgb" then
    result = to_rgb(Util.get_word())
  elseif mode == "hex" then
    result = to_hex(Util.get_word())
  else
    return print "Not Supported!"
  end

  vim.cmd(string.format("s/%s/%s", Util.get_word(), result))
end

vim.cmd [[
  command! -nargs=? -range=% ToRgb call v:lua.Util.convert_color('rgb')
  command! -nargs=? -range=% ToHex call v:lua.Util.convert_color('hex')
]]

Util.get_word = function()
  local first_line, last_line = fn.getpos("'<")[2], fn.getpos("'>")[2]
  local first_col, last_col = fn.getpos("'<")[3], fn.getpos("'>")[3]
  return fn.getline(first_line, last_line)[1]:sub(first_col, last_col)
end

Util.borders = {
  { "🭽", "FloatBorder" },
  { "▔", "FloatBorder" },
  { "🭾", "FloatBorder" },
  { "▕", "FloatBorder" },
  { "🭿", "FloatBorder" },
  { "▁", "FloatBorder" },
  { "🭼", "FloatBorder" },
  { "▏", "FloatBorder" },
}

Util.lsp_on_attach = function(client)
  if client.resolved_capabilities.code_lens then
    vim.cmd [[
    augroup CodeLens
      au!
      au CursorHold,CursorHoldI * lua vim.lsp.codelens.refresh()
    augroup END
    ]]
  end
  require("modules.lsp.mappings").lsp_mappings()
end

Util.lsp_on_init = function()
  print "Language Server Client successfully started!"
end

return Util
