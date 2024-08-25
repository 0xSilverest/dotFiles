local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
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
