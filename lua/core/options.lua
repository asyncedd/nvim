local o = vim.opt
local g = vim.g

g.mapleader = " "
g.localmapleader = " "
o.shiftwidth = 2
o.undofile = true
o.backup = false
o.writebackup = false
o.mouse = "a"
o.swapfile = false
o.hidden = true
o.clipboard = "unnamed,unnamedplus"
o.expandtab = true
o.breakindent = true
o.cursorline = true
o.linebreak = true
o.relativenumber = true
o.number = true
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.showmode = false
o.wrap = true
o.signcolumn = "yes"
o.fillchars:append "eob: "
o.ignorecase = true
o.incsearch = true
o.infercase = true
o.smartcase = true
o.smartindent = true
o.completeopt = "menuone,noinsert,noselect"
o.virtualedit = "onemore"
o.formatoptions = "qjl1"
o.splitkeep = "screen"
o.list = true
o.listchars = "eol:↴,space:⋅"
o.tabstop = 2
o.foldcolumn = '1' -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true
o.foldmethod = "manual"
o.showtabline = 2
vim.cmd([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])
vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
})
