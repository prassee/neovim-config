vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.cmdheight = 0

vim.opt.termguicolors = true

vim.cmd [[ set noswapfile ]]

--Line numbers
vim.wo.number = true

vim.o.clipboard = "unnamedplus"

local wk = require("which-key")
wk.register(_, _)
