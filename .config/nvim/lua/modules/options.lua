local o = vim.opt

o.encoding = "UTF-8"
o.number = true
o.relativenumber = true
o.startofline = false
o.splitright = true
o.splitbelow = true
o.smartindent = true
o.autoindent = true
o.list = true
o.lazyredraw = true
o.equalalways = true
o.smartcase = true
o.ignorecase = true
o.hlsearch = true
o.syntax = "on"

o.foldmethod="marker"
o.backupcopy = "yes"

o.completeopt    = {
  "menu",
  "menuone",
  "noselect",
  "noinsert",
}

o.mouse = "n"
o.shell = "/usr/bin/bash"
o.laststatus = 2
o.pumheight = 10
o.re = 0
o.scrolloff = 2
o.sidescroll = 2
o.shiftwidth = 3
o.sidescrolloff = 15
o.tabstop = 3
o.timeoutlen = 400
o.updatetime = 1000
o.joinspaces = false
o.clipboard = "unnamedplus"
o.wildmode = "longest,list"
