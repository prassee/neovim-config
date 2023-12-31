vim.cmd([[ set noswapfile ]])

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.cmdheight = 1
vim.opt.termguicolors = true
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.shell = "fish"
vim.opt.showcmd = true
vim.wo.number = true
vim.opt.smarttab = true

vim.g.maplocalleader = "\\"

-- vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true
vim.wo.number = true
-- Save undo history
-- vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
-- vim.o.updatetime = 250
-- vim.o.timeoutlen = 300

vim.keymap.set({ "n", "i" }, "<leader>s", "<Esc>:w<cr>")

vim.keymap.set({ "n", "i" }, "<C-e>", "<End>")
vim.keymap.set({ "n", "i" }, "<C-a>", "<Esc>^i<Esc>")

-- go between prev & next visited buffer
vim.keymap.set("n", "<M-left>", "<Esc>:bprevious<Esc>")
vim.keymap.set("n", "<M-right>", "<Esc>:bnext<Esc>")

vim.keymap.set("n", "<M-down>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<M-up>", ":m .-2<CR>==") -- move line down(n)

vim.keymap.set("n", "<leader>qq", "<Esc>:wqall<cr>")
-- select all with Ctrl A
vim.keymap.set("n", "<C-a>", "gg<S-v>G")
