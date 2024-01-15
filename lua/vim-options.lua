vim.cmd([[ set noswapfile ]])

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")

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

-- Case-insensitive searching UNLESS \C or capital in search

vim.keymap.set({ "n", "i" }, "<leader>s", "<Esc>:w<cr>")
vim.keymap.set({ "n" }, "<leader><leader>l", "<Esc>:Lazy update<cr>")

vim.keymap.set({ "n", "i" }, "<C-e>", "<End>")
vim.keymap.set({ "n", "i" }, "<C-a>", "<Esc>^i<Esc>")

-- go between prev & next visited buffer
vim.keymap.set("n", "<M-S-left>", "<Esc>:bprevious<Esc>")
vim.keymap.set("n", "<M-S-right>", "<Esc>:bnext<Esc>")

vim.keymap.set("n", "<M-left>", "g;")
vim.keymap.set("n", "<M-right>", "g,")

vim.keymap.set("n", "<M-down>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<M-up>", ":m .-2<CR>==") -- move line down(n)

vim.keymap.set("n", "<leader>qq", "<Esc>:wqall<cr>")
-- select all with Ctrl A
vim.keymap.set("n", "<C-a>", "gg<S-v>G")
