vim.cmd [[ set noswapfile ]]

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.cmdheight = 0
vim.opt.termguicolors = true
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.wo.number = true

-- vim.o.clipboard = 'unnamedplus'

-- Enable break indent
-- vim.o.breakindent = true

-- Save undo history
-- vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
-- vim.o.updatetime = 250
-- vim.o.timeoutlen = 300


vim.keymap.set('n', '<leader>s', '<Esc>:w<cr>')
vim.keymap.set('i', '<leader>s', '<Esc>:w<cr>')

vim.keymap.set('n', '<C-e>', '<End>')
vim.keymap.set('n', '<C-a>', '<Esc>^i<Esc>')
