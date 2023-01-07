require("toggleterm").setup {}
local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":ToggleTerm direction=float<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>|", ":ToggleTerm direction=vertical<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>_", ":ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader><leader><Enter>", ":ToggleTermSendVisualSelection <CR>",
  { noremap = true, silent = true })
