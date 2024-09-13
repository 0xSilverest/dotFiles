local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.cmd([[
  cnoreabbrev W w
  cnoreabbrev Q q
  cnoreabbrev Wq wq
  cnoreabbrev WQ wq
  cnoreabbrev QW wq
  cnoreabbrev Qw wq
]])

require('plugins')
require("lazy").setup("plugins")

require('modules')

vim.cmd.colorscheme('palenight')

if vim.g.neovide then
  vim.g.neovide_input_use_logo = 1
  vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
  vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
  vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
  vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

  vim.o.guifont = "FiraCode Nerd Font:h12"

  vim.g.neovide_line_space = 0

  vim.g.neovide_refresh_rate = 90

  vim.g.neovide_cursor_animation_length = 0.03

  vim.g.neovide_cursor_trail_length = 0

  vim.g.neovide_cursor_vfx_mode = ""

  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
end
