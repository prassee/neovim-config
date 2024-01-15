vim.cmd([[ set noswapfile ]])

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- vim.cmd("set clipboard+=unnamedplus")

vim.opt.cmdheight = 1
vim.opt.termguicolors = true
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.shell = "fish"
vim.opt.showcmd = true
vim.opt.smarttab = true
vim.opt.scrolloff = 10
vim.opt.colorcolumn = "90"
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.wo.number = true

vim.g.maplocalleader = "\\"

-- Enable break indent
vim.o.breakindent = true
vim.wo.number = true
vim.wo.signcolumn = "yes"
